contract A {
    init() {}
    receive() {
        // Test case: compare myCode() with codeOf expression for the current contract
        let eq: Bool = myCode() == codeOf A;
    }
}
