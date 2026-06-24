contract TestContract {
    receive() {
        // Testing string concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("TON!");
        let str: String = sb.toString();
        dump(str);
    }
}
