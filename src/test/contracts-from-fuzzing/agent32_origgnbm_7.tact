contract TestStringBuilder {
    receive() {
        // Test string concatenation using StringBuilder
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("Tact Builders!");
        let s: String = b.toString();
        self.reply(s.asComment());
    }
}
