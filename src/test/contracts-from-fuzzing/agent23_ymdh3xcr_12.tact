contract TestStringEquality {
    receive() {
        // Testing string equality operator
        // Expecting to dump true as both strings are identical
        dump("hello" == "hello");
    }
}
