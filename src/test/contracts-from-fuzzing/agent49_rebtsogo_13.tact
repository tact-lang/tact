contract Test {
    receive() {
        let x: Int = 5;
        do {
            x = x - 1;
        } until (x == 2);
        dump(x);
    }
}
