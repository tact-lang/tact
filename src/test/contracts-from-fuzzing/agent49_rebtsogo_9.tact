contract Test {
    receive() {
        let i: Int = 0;
        repeat (5) {
            i = i + 1;
        }
        dump(i);
    }
}
