contract Test {
    receive() {
        // Test string equality comparison in an if-statement
        let str1: String = "abc";
        let str2: String = "abc";
        if (str1 == str2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
