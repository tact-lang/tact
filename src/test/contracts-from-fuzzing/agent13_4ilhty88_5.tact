contract TestRepeatValid {
    receive() {
        let x: Int = 1;
        repeat (3) {
            x = x + 1;
        }
        dump(x); // expected dump: 4
    }
}
