/*
Fuzz-Test: Additional Edge Cases for System and State-Related Functions

This file includes several contracts that explore subtle combinations of core context and system functions within receiver functions. These tests are designed to further fuzz and stress-test the Tact compiler without repeating known issues.

Tests include:

1. StateFunctionsTest: A contract that reads several system state values (myBalance(), myCode(), myStorageDue(), and gasConsumed()) in a receiver and aggregates them in persistent state.

2. RecursiveCommitTest: A contract that calls commit() twice within a receiver and updates a counter, testing the use of commit within receivers.

3. InlineComplexTest: A contract that computes an inline complex arithmetic expression using self.state variable and then replies—testing expression handling in a receiver.

None of these tests duplicate known documented issues; they explore additional combinations and stress-test the system functions in receivers.
*/

contract StateFunctionsTest {
    balanceSnapshot: Int;

    init() {
        self.balanceSnapshot = 0;
    }

    receive() {
        // Read system state values
        let b: Int = myBalance();
        let code: Cell = myCode();
        let due: Int = myStorageDue();
        let gasUsed: Int = gasConsumed();

        // Aggregate the read values (note: this arithmetic is arbitrary and for testing purposes)
        self.balanceSnapshot = b + due + gasUsed;

        // Reply to indicate the receiver executed
        self.reply("state functions test executed".asComment());
    }
}

contract RecursiveCommitTest {
    counter: Int;

    init() {
        self.counter = 0;
    }

    receive() {
        // Call commit() twice in the receiver
        commit();
        commit();

        // Update state
        self.counter = self.counter + 1;

        self.reply("recursive commit test executed".asComment());
    }
}

contract InlineComplexTest {
    value: Int;

    init() {
        self.value = 10;
    }

    receive() {
        // Compute a complex arithmetic expression using a combination of operators
        let result: Int = (self.value * 2 + 45) / (self.value - 5) - 3;
        // For testing, we do not convert 'result' to a string; instead, we simply reply with a static comment
        self.reply("inline complex test executed".asComment());
    }
}
