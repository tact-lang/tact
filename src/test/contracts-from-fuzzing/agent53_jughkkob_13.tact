///////////////////////////////////////////////
// Test 13: Using wildcards in trait function parameters (valid discard parameters in default implementation)

trait WildThing {
    // Wildcards are used for unused parameters
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract YouMakeMyHeartSing with WildThing {
    // Overriding with proper named parameters
    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }
    
    receive() {}
}

///////////////////////////////////////////////
// Test 14: Using wildcard in a local let binding (should be disallowed for further use)

contract TestLocalDiscard {
    receive() {
         let _ : Int = 10;
         // using _ here to print, which should fail
         // dump(_); // intentionally commented out because accessing discard is not allowed
    }
}
