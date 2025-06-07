contract TestRepeat {
    receive() {
        let num: Int = 1;
        repeat (3) {
            num *= 2;
        }
        dump(num);
    }
}
