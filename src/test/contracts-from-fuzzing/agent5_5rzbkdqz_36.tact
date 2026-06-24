/*
Final Fuzz-Testing Conclusion: Getter Functions and State Modifications in Tact

Our extensive fuzz-testing cycle for the asm functions feature has now extended to examining the behavior of getter functions with respect to state modifications. The official Tact documentation clearly states that getter functions cannot modify the contract’s state variables; they are meant only to read state values and use them in expressions (see docs_book_contracts.md  ).

Test Overview:
• We defined two contracts. The first, TestGetterRead, contains a standard getter that returns a state variable without modification. The second, TestGetterModification, intentionally increments a state variable inside a getter.

    contract TestGetterModification {
        foo: Int;

        init() {
            self.foo = 0;
        }

        // Getter function that modifies 'foo' during execution
        get fun getFoo(): Int {
            self.foo = self.foo + 1;
            return self.foo;
        }
    }

Observations:
– The TestGetterModification contract compiles without error.
– When the getter getFoo() is called, it returns a modified value (e.g. 1 on the first call), indicating that the state variable is changed during the execution.
– However, these modifications are not persisted to storage once the TVM run concludes; subsequent accesses to the state (via regular functions) reveal that the initial persistent state remains unchanged.

Conclusion:
Our tests confirm that, contrary to the simplified reading of the documentation, getter functions in Tact can indeed modify state variables at runtime. Nonetheless, such modifications have no lasting effect on the persistent storage of a contract. This divergence between the documented behavior—stating that getters can only read state—and the actual runtime behavior (where temporary modifications are allowed) is an important nuance for developers. Users must not rely on getters for any persistent state changes and should instead use mutation functions with attributes like mutates/extends when true state modification is desired.

This insight is consistent with our findings during extensive fuzz-testing and aligns with the nuanced explanation provided in the documentation regarding TVM initialization and state update mechanics (see also docs_book_assembly-functions.md  ).

End of Report
*/