trait Base {
    // Abstract function, must be implemented by inheritors
    abstract fun f(): Int;
}

trait Derived with Base {
    // Override the abstract function to provide a default implementation
    override fun f(): Int {
        return 10;
    }
}

contract Test() with Derived {
    // Override again to confirm layered resolution
    override fun f(): Int {
        return 20;
    }

    receive() {
        let x = self.f();
        require(x == 20, "Incorrect layered override");
        cashback(sender());
    }
}
