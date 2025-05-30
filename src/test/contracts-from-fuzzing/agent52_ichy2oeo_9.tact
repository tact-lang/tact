contract TestLetFailure {
    receive() {
        let a: Int = 5;
        a = 6; // This should be an error as 'let' variables are immutable
    }
}
