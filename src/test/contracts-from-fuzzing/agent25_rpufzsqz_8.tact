contract TestRepeat {
    receive() {
        let x: Int = 1;
        repeat (5) {
            x += 2;
        }
        dump(x); // expected output: 11
    }
}
