contract Test {
    receive() {
        // Test Int.toString() and Int.toFloatString() string conversion functions
        let s1: String = (123456789).toString();
        if (s1 != "123456789") {
            let dummy: Int = s1.hashData();
        }

        let s2: String = (123456789).toFloatString(9);
        if (s2 != "0.123456789") {
            let dummy: Int = s2.hashData();
        }
    }
}
