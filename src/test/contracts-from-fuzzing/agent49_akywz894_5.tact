trait A {
    virtual const x: Int = 5;
}

trait B {
    virtual const x: Int = 10;
}

contract C() with A, B {
    // To resolve the conflict, we explicitly override the conflicting constant
    override const x: Int = 15;

    receive() {
        dump(self.x);
        cashback(sender());
    }
}
