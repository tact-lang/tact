trait C {
    virtual const X: Int = 42;
}

trait D {
    virtual const X: Int = 100;
}

contract E() with C, D {
    // Must resolve the conflict by overriding constant X
    override const X: Int = 200;

    receive() {
        dump(self.X); // should output 200
        cashback(sender());
    }
}
