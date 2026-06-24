// Snippet: ThrowIfUnlessTest

contract ThrowIfUnlessTest {
    state: Int = 0;

    // On receiving message "test", use throwIf and throwUnless to test error conditions
    receive("test") {
        let a: Int = 5;
        // Should not throw because condition is false: 5 > 6 is false
        throwIf(1000, a > 6);
        // Should not throw because condition holds: 5 equals 5
        throwUnless(1001, a == 5);
        self.state = self.state + 1; // state becomes 1

        // Modify a so that it becomes 6
        a = a + 1;
        // Should not throw because 6 equals 6
        throwUnless(1002, a == 6);
        // Should not throw because a < 6 is false
        throwIf(1003, a < 6);

        // This will cause a throw because 6 is not equal to 7
        throwUnless(1004, a == 7);

        // Following code will not execute due to throw
        self.state = self.state + 100;
    }
}
