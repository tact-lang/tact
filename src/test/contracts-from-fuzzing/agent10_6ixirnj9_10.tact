// Fuzz-Test Suite for Wildcard Symbol '_' in Tact

// ==============================================================
// Test 1: Valid usage in receiver function parameter with message type
message TestMsg {}
contract ReceiverTest {
    // Using '_' to discard the received message value
    receive(_: TestMsg) {
        // Nothing to do
    }
}

// ==============================================================
// Test 2: Valid usage in a global function parameter in a trait
trait WildThing {
    // Using wildcards for parameter names in trait definition (values discarded)
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract TraitImpl with WildThing {
    // Overriding using proper identifiers
    override fun assure(a: Int, b: Int): Bool {
        return a + b > 0;
    }

    receive() {
        // Calling the trait function via self
        dump(self.assure(10,20)); // should output true
    }
}

// ==============================================================
// Test 3: Valid usage in global function with discard parameters
fun discardParam(_: Int): Int {
    return 100;
}

contract GlobalFuncTest {
    receive() {
        dump(discardParam(55)); // should output 100
    }
}

// ==============================================================
// Test 4: Using multiple wildcards in a single function parameter list
fun multipleWildcards(_: Int, _: Int): Int {
    return 42;
}

contract MultipleWildcardsTest {
    receive() {
        dump(multipleWildcards(1,2)); // should output 42
    }
}

// ==============================================================
// Test 5: Valid usage of wildcard in destructuring assignment (match pattern)
struct Pair { first: Int; second: Int }

contract DestructuringTest {
    receive() {
        let p = Pair { first: 100, second: 200 };
        // Discard the second field using wildcard
        let Pair { first, second: _ } = p;
        dump(first); // should dump 100
    }
}

// ==============================================================
// Test 6: Valid usage of wildcards in foreach loops over a map
contract ForeachTest {
    receive() {
        let quartiles: map<Int, Int> = emptyMap();
        quartiles.set(1, 25);
        quartiles.set(2, 50);
        quartiles.set(3, 75);
        // Discard both key and value
        foreach (_, _ in quartiles) {
            // iteration without binding keys/values is allowed
        }
    }
}

// ==============================================================
// Test 7: Invalid usage cases -- these should be rejected by the compiler
// 
// 7A: Using '_' as a struct field name (should be rejected)
// Uncommenting the following snippet should trigger a compile error
/*
struct InvalidStruct { _ : Int }

contract Dummy1 {
    receive() {}
}
*/

// 7B: Using '_' as a contract name (should be rejected)
/*
contract _ {
    receive() {}
}
*/

// 7C: Using '_' as a message name (should be rejected)
/*
message _ { value: Int }

contract Dummy2 {
    receive() {}
}
*/

// 7D: Using '_' as a local variable and then trying to access it (should be rejected)
/*
contract LocalVarTest {
    receive() {
        let _ = 123; // valid declaration for discarding
        dump(_);     // ERROR: cannot access wildcard
    }
}
*/

// ==============================================================
// End of Fuzz-Test Suite for '_' wildcard usage in Tact

// Note: The invalid tests in section 7 are provided as commented-out snippets. 
// Their rejection by the compiler confirms that '_' is disallowed except in discard positions, 
// matching both documentation and expected behavior.
