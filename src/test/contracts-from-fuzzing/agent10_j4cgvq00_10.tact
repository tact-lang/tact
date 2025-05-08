contract Test {
    receive() {
        // Test: using myCode() equals codeOf for the current contract
        let cell1 = myCode();
        let cell2 = codeOf Test;
        let eq: Bool = cell1 == cell2;
    }
}
