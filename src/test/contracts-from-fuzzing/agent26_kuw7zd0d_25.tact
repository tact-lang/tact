contract TestTailString {
    receive() {
        // Testing beginTailString with escape sequences
        let sb: StringBuilder = beginTailString();
        sb.append("Tail string with new line\n and tab\t characters");
        let s: String = sb.toString();
    }
}
