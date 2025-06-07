contract TestRepeat {
    receive() {
        let i: Int = 0;
        repeat (5) {
            i += 1;
        }
        dump(i);
    }
}
