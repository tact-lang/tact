primitive Int;
primitive Bool;

trait BaseTrait {
    
}

@name(inc)
mutates extends native inc(self: Int): Int;