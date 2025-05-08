contract TestExtensionChaining {
    receive() {
        // Extension function chaining on an integer literal
        let s: Cell = 42.toString().asComment();
        dump(s);
    }
}
