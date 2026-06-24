contract TestRepeatValid {
    receive() {
        let x: Int = 1;
        repeat (3) {
            x = x + x;
        }
        dump(x);
    }
}
