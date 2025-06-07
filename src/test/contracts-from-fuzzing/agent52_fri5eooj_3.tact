contract TestStringLiterals {
    receive() {
        let str1: String = "Hello, World!";
        let str2: String = "Escaped quote: \" and backslash: \\";
        let str3: String = "Line 1\nLine 2";
        let str4: String = "Tab\tSeparated";
    }
}