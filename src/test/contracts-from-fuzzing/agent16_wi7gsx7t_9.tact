contract TestStringLiteral() {
    // Testing string literal with escape sequences as a compile-time constant
    const s: String = "Hello\nWorld\twith\x21";

    // Getter to expose the constant value
    get fun getString(): String {
        return self.s;
    }

    // Dummy receiver to force the compiler to compile the function
    receive() {
        cashback(sender());
    }
}
