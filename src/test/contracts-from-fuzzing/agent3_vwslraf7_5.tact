trait A {
    virtual fun bar(): Int { return 1; }
    virtual const X: Int = 100;
}

trait B with A {
    override fun bar(): Int { return 2; }
    override const X: Int = 200;
}

trait C with A {
    override fun bar(): Int { return 3; }
    override const X: Int = 300;
}

contract D() with B, C {
    // To resolve diamond inheritance, we override bar() and constant X explicitly
    override fun bar(): Int { return 4; }
    override const X: Int = 400;

    receive() {
        let result = self.bar() + self.X; // Expected 4 + 400 = 404
        dump(result);
        cashback(sender());
    }
}
