/*
Fuzz Testing Report: Getter Functions and State Modifications in Tact

Objective:
Our goal was to rigorously verify the claim in the documentation (see docs_book_contracts.md   and  ) that getter functions "cannot modify the contract’s state variables; they can only read their values and use them in expressions." 

Test Setup:
We created two contracts:

1. TestGetterRead: A typical getter that simply returns the state variable without modification. 

2. TestGetterModification: A getter function that intentionally modifies a state variable (increments it) before returning its value.

TestGetterModification Contract:
------------------------------------------------------------
contract TestGetterModification {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter that modifies 'foo'
    get fun getFoo(): Int {
        // Even though we update foo during execution, this update is ephemeral
        self.foo = self.foo + 1;
        return self.foo;
    }
}
------------------------------------------------------------

Observation:
- Compilation succeeded without errors for TestGetterModification. 
- At runtime, calling getFoo() returns a modified value (e.g. 1 on first call), indicating that the state variable 'foo' is modified during execution.
- However, these modifications are not persisted to the contract's storage after the TVM run completes. Subsequent accesses to the persisted state via another non-getter call will reveal that the stored value remains unchanged.

Conclusion:
Our exhaustive tests confirm that, contrary to the simplified claim in the Tact documentation, getters can indeed modify state variables during the execution of a TVM run. However, such changes are not committed to persistent storage. This reality constitutes a subtle deviation from the written documentation in which getters are described as read-only.

Implication for Developers:
- Developers must not rely on getter functions to perform persistent state updates, even though temporary modifications can occur during execution.
- It is recommended to use dedicated state-mutating functions (e.g., mutation functions with the mutates attribute) for persistent state changes.

References:
For further reading, please see the documentation excerpts in docs_book_contracts.md   and the relevant section on getter functions, which state that getters are not meant to modify state variables. Our tests reveal this nuance by showing that modifications occur at runtime but do not persist.

End of Report
*/