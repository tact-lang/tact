contract TestContract {
    receive() {
        // Testing string concatenation using StringBuilder.concat
        let sb: StringBuilder = beginString()
            .concat("Hello, ")
            .concat("Tact!");
        let s: String = sb.toString();
        let _slice: Slice = s.asSlice();
    }
}
