contract TestCodeOfCorrected {
    receive() {
        let c: Cell = codeOf TestCodeOfCorrected;
        // Comparing with myCode() if needed
        let flag: Bool = myCode() == codeOf TestCodeOfCorrected; // expected: true
    }
}
