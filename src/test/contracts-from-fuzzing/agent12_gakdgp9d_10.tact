contract TestRepeatValid {
    receive() {
        let sum: Int = 0;
        repeat (3) {
            sum += 1;
        }
        dump(sum); // expected output: 3
    }
}
