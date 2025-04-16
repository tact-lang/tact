contract TestWhile {
    receive() {
        let i: Int = 0;
        while (i < 5) {
            i += 1;
        }
        dump(i);
    }
}
