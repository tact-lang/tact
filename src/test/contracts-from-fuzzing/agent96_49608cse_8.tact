contract TestContract {
    receive() {
        // Testing string equality using == operator
        let s1: String = "abc";
        let s2: String = "abc";
        if (s1 == s2) {
            // Strings are equal
        } else {
            // They are not equal
        }
    }
}
