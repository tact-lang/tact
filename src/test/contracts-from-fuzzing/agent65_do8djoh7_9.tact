// Test 2: Valid usage of wildcard in trait method parameter

trait WildTrait {
    // Wildcard used to indicate that the first parameter is discarded
    virtual fun foo(_: Int, a: Int): Bool { return true; }
}

contract TestTrait with WildTrait {
    override fun foo(b: Int, a: Int): Bool {
        // Overriding with proper named parameter for first argument
        return b > a;
    }

    receive() {}
}
