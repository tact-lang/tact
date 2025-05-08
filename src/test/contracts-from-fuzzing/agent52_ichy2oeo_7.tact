trait TestTrait {
    // A simple virtual function
    virtual fun test(): Int {
        return 1;
    }
}

contract TestTraitImpl with TestTrait {
    // Overriding the virtual function
    override fun test(): Int {
        return 42;
    }

    // A simple receiver to trigger compilation
    receive() {
        let x = self.test();
        if (x != 42) {
            throw(1);
        }
    }
}
