contract TestStringLiterals {
    receive() {
        let str1: String = "Hello, World!";
        let str2: String = "Hello, World!";
        let result: Bool = str1 == str2;
    }
}