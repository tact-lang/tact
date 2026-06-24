contract TestRepeatOverflow {
    receive() {
        let counter: Int = 0;
        repeat (2147483648) {
            counter += 1;
        }
        dump(counter);
    }
}
