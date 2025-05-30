contract TestRepeat {
    receive() {
        let acc: Int = 1;
        repeat (5) {
            acc *= 2;
        }
        dump(acc);
    }
}
