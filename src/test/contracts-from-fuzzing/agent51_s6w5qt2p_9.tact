contract Test {
    receive() {
        let value: Int = 5;
        value += 10;
        dump(value);
    }
}
