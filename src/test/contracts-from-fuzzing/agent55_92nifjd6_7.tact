contract TestRepeat {
    receive() {
        let counter: Int = 0;
        repeat (5) {
            counter += 1;
        }
        dump(counter);
    }
}
