contract DoUntil {
    receive() {
        let x: Int = 10;
        do {
            x -= 1;
        } until (x == 0);
        dump(x);
    }
}
