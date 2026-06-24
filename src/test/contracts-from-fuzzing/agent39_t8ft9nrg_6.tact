trait FTrait {
    // Abstract function that must be implemented by inheritors
    abstract fun f(): Int;
}

trait GTrait with FTrait {
    // Provide a default override for the abstract function f()
    override fun f(): Int {
        return 50;
    }
}

contract ComposeTest2() with GTrait {
    // Inherit the implementation from GTrait without further override
    // The receive function tests the layered trait composition at runtime
    receive() {
        // f() is expected to return 50 as provided by GTrait
        require(self.f() == 50, "Layered trait error");
    }
}
