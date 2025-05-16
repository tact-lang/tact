trait A {
    virtual fun f(): Int {
        return 1;
    }
}

trait B with A {
    override fun f(): Int {
        return 2;
    }
}

trait C with A {
    override fun f(): Int {
        return 3;
    }
}

// Diamond shape: Contract D implements traits B and C; resolution order should use C's version
contract D() with B, C {
    receive() {
        // Expected: f() returns 3 because trait C (last in list) should override trait B
        let res = self.f();
        dump(res);
    }
}
