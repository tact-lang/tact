contract TestRepeatValid {
    receive() {
        let x: Int = 1;
        repeat (3) {
            x *= 2;
        }
        dump(x);
    }
}
