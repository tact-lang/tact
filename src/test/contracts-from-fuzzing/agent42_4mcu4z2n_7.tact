contract SelfContract {
    receive() {
        // Verify that codeOf on current contract is equal to myCode()
        let same = myCode() == codeOf SelfContract;
    }
}
