contract Test {
    receive() {
        // Test B: StringBuilder concatenation using chained concat() calls
        let sb: StringBuilder = beginString().concat("Hello").concat(", ").concat("Tact!");
        let s: String = sb.toString();
        dump(s);
    }
}
