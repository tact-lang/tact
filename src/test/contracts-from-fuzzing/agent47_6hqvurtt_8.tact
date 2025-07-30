contract SelfCheck {
    receive() {
        // Using codeOf on the current contract. Its result should be equal to myCode()
        let flag: Bool = myCode() == codeOf SelfCheck;
    }
}
