contract SelfTest {
    init() {}
    
    receive() {
        // Test that myCode() produces the same result as codeOf for the current contract
        let c1 = myCode();
        let c2 = codeOf SelfTest;
        // We don't enforce equality at compile time, but this shows the intended usage
    }
}
