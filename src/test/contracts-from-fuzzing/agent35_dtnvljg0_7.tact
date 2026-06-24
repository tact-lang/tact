trait A {
    virtual fun m(): Int { return 100; }
}

trait B with A {
    override fun m(): Int { return 200; }
}

trait C with A {
    override fun m(): Int { return 300; }
}

contract D() with B, C {
    override fun m(): Int { return 400; }
    
    receive() {
        let result = self.m();
        dump(result);
    }
}
