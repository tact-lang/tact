trait A {
    abstract fun a(): Int;
    virtual fun b(): Int {
        return 100;
    }
}

trait B {
    virtual fun c(): Int {
        return 200;
    }
}

contract TestContract() with A, B {
    override fun a(): Int {
        return 10;
    }
    override fun b(): Int {
        return self.a() + 1;
    }
    override fun c(): Int {
        return self.b() + 2;
    }
    
    receive() {
        // Expected: a() = 10, b() = 11, c() = 13, total = 34
        dump(self.a() + self.b() + self.c());
    }
}
