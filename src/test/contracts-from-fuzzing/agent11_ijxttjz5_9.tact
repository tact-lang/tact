contract E {
    receive() {
        // Comparing myCode() with codeOf for the current contract E
        let same = myCode() == codeOf E; // Expected to be true
    }
}
