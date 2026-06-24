contract SelfContract {
    receive() {
        let a = myCode();
        let b = codeOf SelfContract;
        // Check if codeOf for current contract equals myCode()
        a == b;
    }
}
