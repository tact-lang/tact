fun testCompare(s1: String, s2: String): Bool {
    return s1 == s2;
}

contract TestContract {
    receive() {
        let same = testCompare("Hello", "Hello");
        let different = testCompare("Hello", "World");
    }
}
