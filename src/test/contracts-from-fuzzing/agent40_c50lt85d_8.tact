contract UnicodeTest {
    receive() {
         let s: String = "Smile: \u{1F600}";
         if (s == "Smile: \u{1F600}") {
             // Equality check for Unicode escape sequence
         }
    }
}
