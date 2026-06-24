trait X {
    virtual fun getVal(): Int { return 1; }
}

trait Y {
    virtual fun getVal(): Int { return 2; }
}

contract Z() with X, Y {
    // Must override conflicting getVal from X and Y
    override fun getVal(): Int { return 10; }

    receive() {
        let val = self.getVal(); // should be 10
        cashback(sender());
    }
}
