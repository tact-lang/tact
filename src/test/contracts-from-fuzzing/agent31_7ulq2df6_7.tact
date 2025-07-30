trait A {
    // Abstract function a must be overridden
    abstract fun a(): Int;
    // Virtual function b with default implementation returning 100
    virtual fun b(): Int {
        return 100;
    }
}

trait B {
    // Virtual function b with default implementation returning 200
    virtual fun b(): Int {
        return 200;
    }
    // Abstract function c must be overridden
    abstract fun c(): Int;
}

contract C() with A, B {
    // Override abstract function a
    override fun a(): Int {
        return 1;
    }
    
    // Must resolve conflict for b from both A and B. Override it explicitly.
    override fun b(): Int {
        return 300; // expected: 300 (explicit override)
    }
    
    // Override abstract function c
    override fun c(): Int {
        return 10;
    }
    
    receive() {
        let sum = self.a() + self.b() + self.c(); // expected: 1 + 300 + 10 = 311
        dump(sum);
        cashback(sender());
    }
    
    get fun getSum(): Int {
        return self.a() + self.b() + self.c();
    }
}

fun main() {}
