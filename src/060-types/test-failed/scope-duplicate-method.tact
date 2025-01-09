primitive Int;
primitive Bool;

trait BaseTrait {
    
}

extends fun hello(self: Main): Int {
    return 0;
}

extends fun hello(self: Main): Bool {
    return true;
}

struct Main {
    v: Int = 0;
}