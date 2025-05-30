contract TestRepeatValid {
    receive() {
        let x: Int = 1;
        repeat (10) {
            x = x * 2;
        }
        dump(x);
    }
}
