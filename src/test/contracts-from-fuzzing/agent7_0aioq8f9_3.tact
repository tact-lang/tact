contract Test {
    receive() {
        let value: Int = 5;
        value += 5;
        dump(value);
    }
}
