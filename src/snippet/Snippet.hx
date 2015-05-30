package snippet;

import haxe.macro.Context;
import haxe.macro.Expr;
import tink.macro.ClassBuilder;
import tink.SyntaxHub;

using haxe.io.Path;
using tink.MacroApi;
using sys.io.File;

class Snippet {
	
	static function use() {
		SyntaxHub.classLevel.before('tink.lang.', function (c:ClassBuilder) {
			var target = null;
			
			for (t in 'js,java,cs,php'.split(',')) 
				if (Context.defined(t)) {
					target = t;
					break;
				}
			
				
			var found = false;
			for (m in c)
				switch m.extractMeta(':snippet') {
					case Success(tag):
						
						if (target == null)
							tag.pos.error('@:snippet not supported on current target');
							
						var f = m.getFunction().sure();
						if (f.expr != null)
							f.expr.reject('@:snippet funtions must not have a body');
						
						var file = Context.getPosInfos(c.target.pos).file.directory() + '/${m.name}.$target';
						var source = 
							try {
								file.getContent();
							}
							catch (e:Dynamic) {
								m.pos.error('Failed to open $file: $e');
							}
							
						found = true;
						m.isBound = null;
						f.expr = macro return untyped __js__('(function () { $source; })()');
					default:
				}
			return found;
		});
	}
}