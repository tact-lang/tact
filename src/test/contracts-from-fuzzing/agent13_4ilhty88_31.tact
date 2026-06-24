contract TestWhileFalse {
    receive() {
        let x: Int = 0;
        while (false) {
            x += 1;
        }
        dump(x); // expecting 0
    }
}
