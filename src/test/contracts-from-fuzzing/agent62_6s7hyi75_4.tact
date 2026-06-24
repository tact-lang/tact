contract TestString {
    receive() {
        // Testing string literal expression and extension function call
        let s: String = "Tact is awesome!";
        s.asComment();
    }
}
