trait LeftF {
    virtual fun f(): Int {
        return 1;
    }
}

trait RightF {
    virtual fun f(): Int {
        return 2;
    }
}

contract Resolve() with LeftF, RightF {
    // Explicitly overriding the conflicting function to resolve diamond inheritance
    override fun f(): Int {
        return 42;
    }

    receive() {
        let a = self.f();  // Expected to be 42
        return;
    }
}
