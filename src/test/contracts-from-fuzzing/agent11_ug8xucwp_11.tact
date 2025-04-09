contract TestRepeatNoSemicolon {
    receive() {
        let sum: Int = 0;
        repeat (5) {
            sum += 3;
        }
        dump(sum);
    }
}
