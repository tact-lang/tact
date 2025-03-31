contract TestString {
    receive() {
        // Use a string literal and then convert it to a comment cell
        let s: String = "Hello, Tact!";
        let c: Cell = s.asComment();
        self.reply(c);
    }
}
