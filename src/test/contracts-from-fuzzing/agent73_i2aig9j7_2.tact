contract StringTest {
    receive() {
        let s1: String = "Hello, World!";
        let s2: String = "Hello, World!";
        if (s1 == s2) {
            // Both strings are equal
            return;
        }
    }
}