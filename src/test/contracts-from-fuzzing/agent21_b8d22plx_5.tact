trait A {
    virtual fun foo(): Int {
        return 1;
    }
}

trait B {
    virtual fun foo(): Int {
        return 2;
    }
}

contract C() with A, B {
    // resolving conflict, override the method explicitly
    override fun foo(): Int {
        return 10;
    }

    receive() {
        let res = self.foo();
        // Expected output: 10
        dump(res);
    }
}
