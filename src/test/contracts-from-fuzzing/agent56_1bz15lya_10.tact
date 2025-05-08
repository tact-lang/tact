trait Parent {
    // Abstract constant that must be overridden
    abstract const X: Int;

    // Function that uses the constant
    fun parentFun(): Int {
        return self.X * 3;
    }
}

trait Child with Parent {
    // Provide a default implementation via a virtual constant
    override virtual const X: Int = 5;
}

contract D() with Child {
    // Getter function to test the inherited behavior
    // Expected: parentFun() = 5 * 3 = 15
    get fun res(): Int {
        return self.parentFun();
    }
}
