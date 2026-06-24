contract TestRepeatValid {
    receive() {
        let count: Int = 0;
        repeat (3) {
            count += 1;
        }
        dump(count);
    }
}
