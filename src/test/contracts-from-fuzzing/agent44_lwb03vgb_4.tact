contract Test {
    // B: Valid use of '_' in a regular function parameter (discarding the argument)
    // The parameter is not used, so '_' is acceptable here.
    fun foo(_ : Int) : Int { return 0; }
    receive() { self.foo(10); }
}
