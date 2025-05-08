trait Base {
    // Abstract function must be implemented by inheriting traits or contracts
    abstract fun f(x: Int): Int;
}

trait Derived with Base {
    // Overriding function from Base
    override fun f(x: Int): Int {
        return x + 100;
    }
}

contract TestNested() with Derived {
    // This contract does not override f, so it uses Derived's implementation
    fun test(): Int {
        // Expected: f(5) = 5 + 100 = 105
        return self.f(5);
    }
    
    receive() {
        dump(self.test());
    }
}
