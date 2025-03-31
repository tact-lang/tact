contract TestLongHashData {
    receive() {
        // Testing hashData on a string longer than 127 bytes using a StringBuilder for concatenation
        let sb: StringBuilder = beginString();
        sb.append("01234567890123456789"); // 20 characters
        sb.append("01234567890123456789"); // 40 characters
        sb.append("01234567890123456789"); // 60 characters
        sb.append("01234567890123456789"); // 80 characters
        sb.append("01234567890123456789"); // 100 characters
        sb.append("01234567890123456789"); // 120 characters
        sb.append("0123456789AB");         // 134 characters total
        let s: String = sb.toString();
        // hashData should process only the first 127 bytes without error
        dump(s.hashData());
    }
}
