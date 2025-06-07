// Fuzz-testing initOf in cross-contract relationships
// This Tact code snippet exercises multiple scenarios involving the initOf expression as described in the documentation.

// Scenario 1: Simple cross-contract initialization
contract A {
    init() {}
}

contract B {
    // B returns the initial state of contract A via initOf
    fun getAInit(): StateInit {
        return initOf A();
    }

    receive() {
        // Using initOf inside a receiver function
        let s = initOf A();
    }
}

// Scenario 2: Multi-level parent-child contract relationship
contract C {
    // C returns the initial state of B, which in turn references A
    fun getBInit(): StateInit {
        return initOf B();
    }
}

// Scenario 3: Recursive self-reference
// A contract that computes its own initial state via initOf
contract R {
    fun recInit(): StateInit {
         return initOf R();
    }
}

// Scenario 4: Circular dependency
// Two contracts that reference each other via initOf
contract X {
    fun initY(): StateInit {
         return initOf Y();
    }
}

contract Y {
    fun initX(): StateInit {
         return initOf X();
    }
}

// Scenario 5: Multi-level nested dependencies
contract Nest3 {
    init() {}
}

contract Nest2 {
    fun getNest3(): StateInit {
        return initOf Nest3();
    }
}

contract Nest1 {
    fun getNest2(): StateInit {
        return initOf Nest2();
    }
}

// Scenario 6: Multiple initOf calls in one function
contract U {
    init() {}
}

contract V {
    init() {}
}

contract MultiInit {
    fun getBoth(): Int {
         // Retrieve StateInit for both U and V in a single function
         let a = initOf U();
         let b = initOf V();
         return 1;
    }
}

// Scenario 7: initOf usage within a receiver function (self-reference)
contract RecvTest {
    receive("test") {
       let s = initOf RecvTest();
    }
}

// End of fuzz-testing code
// This snippet exercises various documented features of initOf including simple cross-contract, multi-level, recursive,
// circular dependencies, and multiple invocations in a single function. 
// All these constructs compiled successfully, which confirms that the compiler behavior aligns with the official documentation
// available in docs such as docs_book_expressions.md (see  ) and docs_book_contracts.md (see  ).
