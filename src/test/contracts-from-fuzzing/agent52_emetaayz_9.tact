contract TestWhile {
    receive() {
        let a: Int = 3;
        while (a > 0) {
            a -= 1;
        }
        dump(a);
    }
}
