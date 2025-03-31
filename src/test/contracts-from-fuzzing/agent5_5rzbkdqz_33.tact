/*
Getter Functions and State Modifications: Fuzz Testing Insights

Getter functions in Tact are documented as functions that cannot modify state variables; they are meant solely to read state values and export them off-chain. However, our fuzz-testing process — including tests like TestGetterModification in the previous snippet — reveals a subtle nuance: While getters are conceptually not intended to alter contract state, they actually can perform modifications at runtime. The key point is that any changes made within a getter function are ephemeral; even if executed during the TVM run, they will not be saved to the persistent state at the end of the execution.

For instance, in the contract TestGetterModification:

    contract TestGetterModification {
        foo: Int;
        
        init() {
            self.foo = 0;
        }
        
        get fun getFoo(): Int {
            // Even though we modify foo, these changes are not persisted
            self.foo = self.foo + 1;
            return self.foo;
        }
    }

Compilation succeeds and when this getter is called off-chain the returned value may reflect the modification done during that execution, but the contract’s state stored on-chain remains unchanged. This behavior confirms that while the documentation for getter functions states they cannot modify state, the runtime behavior allows modifications — they are simply not persisted after the TVM run concludes. (See documentation in docs_book_contracts.md and related getter sections.)

This nuance is critical for developers: Despite the restriction stated in the documentation (that getters can only read state) the Tact runtime actually permits in-run modifications, but these changes are thrown away once the TVM execution completes. Thus, it is essential not to rely on getter functions to persist any state changes.

Our exhaustive fuzz-testing confirms this behavior, highlighting the necessity for careful use of getters when interacting with contract state. Developers should rely on explicit state-changing functions (or mutation functions) for persistent modifications, while getters are best reserved to just return state values.

Conclusion: The fuzz-testing cycle confirms that although documentation claims getters cannot modify state variables, they do technically allow state changes during execution, with the caveat that such changes are not committed to storage. This subtle discrepancy underscores the importance of using designated state-modification functions when persistence is required.
*/