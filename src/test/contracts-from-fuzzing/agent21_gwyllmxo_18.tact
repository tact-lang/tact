contract TestStringCompareNe {
    receive() {
        let s1 = "Hello";
        let s2 = "World";
        if (s1 != s2) {
            require(false, "Strings are not equal");
        }
    }
}