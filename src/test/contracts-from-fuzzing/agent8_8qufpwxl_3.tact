trait T1 {
    virtual fun foo(): Int {
        return 1;
    }
}

trait T2 with T1 {
    override fun foo(): Int {
        return 2;
    }
}

contract C() with T2 {
    receive() {
        let a = self.foo(); // Expect a = 2 from T2 override
        return;
    }
}
