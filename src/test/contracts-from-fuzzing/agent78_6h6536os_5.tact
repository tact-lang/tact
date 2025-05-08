contract TestStringSlice {
    // Test conversion between String and Slice without explicit error check
    receive() {
        let s: String = "TestSlice";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        // Implicitly test that conversion works by building the contract
    }
}
