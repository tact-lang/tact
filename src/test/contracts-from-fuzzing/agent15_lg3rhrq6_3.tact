contract Test {
    receive() {
        let x: Int = 0;
        while(x < 3) {
            x = x + 1;
        }
    }
}
