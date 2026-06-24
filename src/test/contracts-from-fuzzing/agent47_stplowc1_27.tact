contract TestNegativeIntToString {
    receive() {
        // Test conversion of a negative integer to a string
        let s: String = (-42).toString();
        s; // expected output: "-42"
    }
}

contract TestEmojiString {
    receive() {
        // Test string literal containing an emoji using \u{...} syntax
        let s: String = "Hello \u{1F603}";  // \u{1F603} represents 😃
        s;
    }
}

contract TestTailString {
    receive() {
        // Test creation of a tail string using beginTailString()
        let sb: StringBuilder = beginTailString();
        sb.append("Tail string test");
        let s: String = sb.toString();
        s; 
    }
}
