contract C {
    receive() {
         // Valid test: Comparing myCode() with codeOf for the current contract
         let comparison = myCode() == codeOf C;
    }
}
