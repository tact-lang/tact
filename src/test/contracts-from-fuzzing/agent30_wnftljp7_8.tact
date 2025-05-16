contract CompareCode {
    receive() {
        // Using codeOf for current contract
        let code1 = codeOf CompareCode;
        let code2 = myCode();

        // Check if both representations are identical
        // This is only for gas verification; the equality check happens on-chain and does not affect state
        let are_equal: Bool = (code1 == code2);
    }
}
