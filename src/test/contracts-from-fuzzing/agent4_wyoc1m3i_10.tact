trait Base {
    // Abstract function to be provided by inheritors
    abstract fun common(): Int;
}

trait T1 with Base {
    // Provide a default implementation
    override fun common(): Int {
        return 1;
    }
}

trait T2 with Base {
    // Provide an alternative default implementation
    override fun common(): Int {
        return 2;
    }
}

contract Diamond() with T1, T2 {
    // Must override 'common' to resolve diamond conflict
    override fun common(): Int {
        // For this test, we decide the value should be 42
        return 42;
    }

    receive() {
        let x = self.common();
        // Validate that the override is effective
        require(x == 42, "diamond inheritance resolution failed");
        cashback(sender());
    }
}
