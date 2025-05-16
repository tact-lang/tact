contract TestCastAndCoercion {
    receive() {
        // Test function call on a literal integer (casting via extension method)
        let s: String = 42.toString();

        // Test function call chaining on a literal string
        // asComment() is an extension function on String that converts it into a comment form
        let c = "Tact is awesome!".asComment();
    }
}
