trait T4 {
    // Abstract function: contract must override it
    abstract fun foo(): Int;
}

trait T5 {
    // Virtual function with default implementation
    virtual fun foo(): Int { return 5; }
}

contract C() with T4, T5 {
    // Overriding the conflicting foo() to satisfy the abstract requirement
    override fun foo(): Int {
        // Choose to simply return T5's default value
        return 5;
    }

    receive() {
        let x = self.foo();
        dump(x);
    }
}

fun main() {
    // Instantiate contract C through its initial state
    let _ = initOf C();
}
