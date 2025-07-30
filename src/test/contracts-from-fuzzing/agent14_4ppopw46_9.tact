contract TestStringEquality {
    receive() {
        // Testing string equality: two string literals containing the same content should be equal.
        let s1: String = "EqualityTest";
        let s2: String = "EqualityTest";
        dump(s1 == s2);
    }
}
