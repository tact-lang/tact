contract TestDoUntil {
    receive() {
        let a: Int = 3;
        do {
            a -= 1;
        } until (a <= 0);
        dump(a);
    }
}
