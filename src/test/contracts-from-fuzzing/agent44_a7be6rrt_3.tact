contract TestContract {
    receive() {
        // Testing escape sequences in string literals
        let s1: String = "Line1\nLine2";
        let s2: String = "Quote: \"";
        let s3: String = "Tab\tCharacter";
        let s4: String = "Unicode: \u{1F602}";
    }
}
