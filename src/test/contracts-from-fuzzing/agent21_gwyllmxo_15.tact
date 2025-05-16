contract TestStringCompareEq {
    receive() {
        let s1 = "Hello";
        let s2 = "Hello";
        if (s1 == s2) {
            require(false, "Strings are equal");
        }
    }
}