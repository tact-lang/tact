contract TestDoUntil {
    receive() {
        let x: Int = 10;
        do {
            x -= 1;
        } until (x == 0);
        dump(x); // expected output: 0
    }
}
