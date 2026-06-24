/*
Getter Functions Modifications Fuzz Test

// Test Contract: It demonstrates that although getters are documented as read-only, they can perform state modifications at runtime (which are not persisted).

contract TestGetterModification {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // A getter that modifies `foo` during runtime
    get fun getFoo(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}

// For contrast, a read-only getter to verify state remains unchanged persistently
contract TestGetterRead {
    bar: Int;

    init() {
        self.bar = 42;
    }

    get fun getBar(): Int {
        return self.bar;
    }
}

/*
Usage/Evidence:
- When calling getFoo(), the function returns an incremented value, e.g. 1 on the first call, indicating that a modification was performed.
- However, subsequent non-getter accesses to `foo` will reveal that the persistent state remains at its initial value (i.e. 0), because the TVM run does not save modifications done during getter execution.

This series of tests confirms the subtle behavior: Although documentation states that getters cannot modify state, the Tact runtime actually permits modifications during execution; they simply are not persisted. This nuance is critical for developers relying on getters for off-chain queries rather than on-chain state changes.

Refer to the official documentation in docs_book_contracts.md on getter functions for more details. 

End of Getter Function Test Report
*/