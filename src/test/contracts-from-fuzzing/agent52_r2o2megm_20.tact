// Scenario N: Using wildcard parameters in trait method declaration

trait WildTrait {
    // Both parameters are discarded in the trait default implementation
    virtual fun compare(_: Int, _: Int): Bool {
        return true;
    }
}

contract MyContract with WildTrait {
    // Overriding with concrete names is allowed
    override fun compare(a: Int, b: Int): Bool {
        return a == b;
    }
    receive() {}
}
