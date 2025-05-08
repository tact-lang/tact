contract TestCasting {
    receive() {
        // Test casting via calling an extension function on an integer literal
        let s = 42.toString();
    }
}
