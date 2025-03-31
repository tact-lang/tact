contract TestStringEquality {
    receive() {
        let s1: String = "Hello";
        let s2: String = "Hello";
        dump(s1 == s2);
    }
}
