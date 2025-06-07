contract TestContract {
    receive() {
        // Test string equality (==) operator
        let s1: String = "Hello";
        let s2: String = "Hello";
        if (s1 == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
