contract TestContract {
    receive() {
        // Test mixing several valid escapes in one string
        let s: String = "Mixed: \n, \t, \r, \u{1F600}, \x41, \"";
        s;
    }
}
