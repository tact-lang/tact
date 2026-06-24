contract Test {
    receive() {
        let s: String = beginString()
            .concat("Hello, ")
            .concat("Tact!")
            .toString();
        dump(s);
    }
}
