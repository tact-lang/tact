contract CodeTestSelf {
    receive() {
        // Valid usage of codeOf on the current contract
        let codeCell = codeOf CodeTestSelf;
    }
}
