contract Simple {
    // no parameters, no explicit init, so an implicit empty init is present
    receive() {
        // Compare current code vs. codeOf expression for the current contract
        let eq = myCode() == codeOf Simple;
    }
}
