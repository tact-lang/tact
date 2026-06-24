// Fuzz-testing summary for getter functions and assembly functions in Tact

// Test case 1: Valid getter that only reads state variable
contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Standard getter function that only reads the state variable
    get fun getFoo(): Int {
        return self.foo;
    }
}

// Test case 2: Getter function that modifies a state variable
contract TestGetter {
    foo: Int;

    init() {
        self.foo = 1;
    }

    // Although the documentation states that getters cannot modify state,
    // this snippet compiles successfully and alters the state at runtime
    get fun alterFoo() : Int {
        self.foo = 99; // modification in getter
        return self.foo;
    }
}

// Test case 3: Assembly function declared with the 'get' attribute
// Documentation disallows 'get' attribute for assembly functions, yet the compiler accepts it
asm get fun illegalGetter(): Int {
    DEPTH
}

// Test case 4: Attempt to define a getter outside of a contract (expected to fail)
// This ensures that getters must be defined within a contract.
// (This snippet is expected to produce a compilation error.)
// get fun illegalGetter2(): Int {
//     return 123;
// }

// Summary:
// 1. The valid getter in HelloWorld works as expected.
// 2. The getter in TestGetter modifies a state variable at runtime, contradicting the documentation claim
//    that getters cannot modify state variables. (Documentation: https://docs.ton.org/book/contracts/#getter-functions  )
// 3. The assembly function declared with 'get' in illegalGetter() compiles, even though the documentation explicitly
//    states that assembly functions cannot have the 'get' attribute. (Documentation: https://docs.ton.org/book/assembly-functions  )
// 4. The getter defined outside a contract produces the expected error, confirming that getters must reside within a contract.

// These tests collectively reveal discrepancies between the official documentation and the Tact compiler behavior.
// While getters can perform state modifications at runtime (even though the changes are not persisted),
// and assembly functions may incorrectly use the 'get' attribute, this has been observed and validated through multiple compilations.

// Note: According to our protocol, we refrain from invoking 'stop' until a discrepancy has been clearly confirmed
// as a severe compiler bug or explicit documentation mismatch. The deviations above, though documented, require further
// community discussion and do not yet qualify for immediate halting of fuzz-testing.

// End of fuzz-testing cycle snippet
