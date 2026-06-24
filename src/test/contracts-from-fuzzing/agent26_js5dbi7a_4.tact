trait T1 {
    virtual fun f(): Int {
        return 1;
    }
}

trait T2 {
    virtual fun f(): Int {
        return 100;
    }
}

contract D() with T1, T2 {
    // Override the conflicting trait function
    override fun f(): Int {
        return 42;
    }

    receive() {
        dump(self.f()); // Expected output: 42
    }
}
