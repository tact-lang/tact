contract TestRepeat {
    receive() {
        let acc: Int = 0;
        repeat (3) {
            acc += 1;
        }
        dump(acc);
    }
}
