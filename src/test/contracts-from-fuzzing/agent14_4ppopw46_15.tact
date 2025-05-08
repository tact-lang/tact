contract TestSBUnicode {
    receive() {
        // Test usage of StringBuilder with a Unicode string containing an emoji
        let sb: StringBuilder = beginString();
        sb.append("Emoji: 😊");
        let s: String = sb.toString();
        dump(s);
    }
}
