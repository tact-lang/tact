contract Test {
    receive() {
        // Valid while loop: decrements x until 0
        let x: Int = 10;
        while (x > 0) {
            x -= 1;
        }
        dump(x); // expects 0
    }
}
