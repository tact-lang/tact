trait T1 {
    virtual const v: Int = 5;
}

trait T2 {
    virtual const v: Int = 10;
}

contract C() with T1, T2 {
    // Must override to resolve the conflicting virtual constant
    override const v: Int = 20;

    receive() {
        dump(self.v); // Expected output: 20
        cashback(sender());
    }
}
