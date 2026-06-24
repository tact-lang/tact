contract TestWhileValid {
    receive() {
        let x: Int = 2;
        while (x > 0) {
            x -= 1;
        }
        dump(x);
    }
}
