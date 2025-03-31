contract TestStringConcatComparison {
    receive() {
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello").concat(", ").concat("Tact!");
        let constructed: String = sb.toString();
        let literal: String = "Hello, Tact!";
        let eq: Bool = constructed.asSlice() == literal.asSlice();
    }
}
