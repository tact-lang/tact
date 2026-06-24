contract Test {
    // Valid: Using wildcard for unused receiver parameter with allowed types (Slice, String)
    receive(_: Slice) {}

    // Valid: Wildcard in function parameter for a normal function; parameter is discarded
    fun discardParam(_: Int): Int {
        // Cannot access the wildcard parameter
        return 42;
    }

    // Valid: Multiple wildcard parameters in a regular function; both are discarded
    fun multiDiscard(_: Int, _: Int): Int {
        return 0;
    }

    // The following are intended misuse cases and should fail compilation:
    
    // 1. Using wildcard as a struct field name
    // Uncommenting the next lines should produce a compiler error: "Wildcard not allowed here"
    // struct S {
    //     _: Int;
    // }

    // 2. Using wildcard as a contract name
    // Uncommenting the following should produce a compiler error
    // contract _ {
    //    receive() {}
    // }

    // 3. Using wildcard as a message (function) name
    // Uncommenting the following should produce a compiler error
    // contract Test2 {
    //    msg fun _(): Int {
    //         return 1;
    //    }
    //    receive() {}
    // }

    // 4. Using wildcard as a variable name in a function scope
    // The declaration below produces an error when trying to access the wildcard variable
    fun accessWildcard(): Int {
        let _ = 42;
        // Attempting to return '_' should fail, as wildcards are not accessible
        // return _; // This line should be commented out to allow compilation
        return 0;
    }

    // 5. Using wildcard in a match pattern
    // If match patterns with wildcards were supported, this would be valid in some ML-like languages.
    // However, in Tact this produces a parse error. Uncommenting the snippet below should produce a compiler error:
    // fun testMatch(x: Int): Int {
    //     return match x {
    //         0 => 10,
    //         _ => 20
    //     };
    // }
}
