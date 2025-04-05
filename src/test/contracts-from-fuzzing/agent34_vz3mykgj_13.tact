contract TestCastCoerce {
    receive() {
        // Using an extension function to convert an integer literal to a string
        let s: String = 42.toString();
    }
}
