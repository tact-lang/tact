contract Test {
    receive() {
        let i: Int = 5;
        i += 5;
        dump(i);
    }
}
