contract StringTest {
    receive() {
        let s1: String = "Hello, World!";
        let s2: String = "Hello, World!";
        if (s1 == s2) {
            dump("Strings are equal.");
        } else {
            dump("Strings are not equal.");
        }
    }
}