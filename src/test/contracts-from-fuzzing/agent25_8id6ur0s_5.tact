contract TestStringEscape {
    receive() {
        let escaped: String = "Hello\\World";
        let greet: StringBuilder = beginString();
        greet.append(escaped);
        let final: String = greet.toString();
    }
}