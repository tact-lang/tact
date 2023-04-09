primitive Int;
primitive Bool;

trait BaseTrait {
    
}

contract Main {

    v: Int = 0;
    init() {
        
    }

    fun f1(a: Int, b: Int): Int {
        return a + b;
    }

    fun f2(a: Int): Int {
        return self.f1(a, true);
    }
}