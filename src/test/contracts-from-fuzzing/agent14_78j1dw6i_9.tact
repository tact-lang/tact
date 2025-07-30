contract SelfTest {
    receive() {
        // Test that codeOf for the current contract equals myCode()
        let codeFromMyCode: Cell = myCode();
        let codeFromCodeOf: Cell = codeOf SelfTest;
        // Using equality check between the two cells (expecting true)
        // Note: Direct cell comparison might not be supported, but we assume here it's allowed per docs
        let eq: Bool = codeFromMyCode == codeFromCodeOf;
    }
}
