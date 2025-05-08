contract Test {
    receive() {
         // Testing unicode escape sequences in strings
         let s: String = "String with unicode: \u26A1 and emoji: \u{1F602}";
    }
}
