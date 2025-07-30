contract Test {
    receive() {
        // While loop: sum numbers 0+1+2
        let i: Int = 0;
        let s: Int = 0;
        while (i < 3) {
            s += i;
            i += 1;
        }
        dump(s);
    }
}
