contract TestContract {
    receive() {
        // While loop testing: decrement x until 0
        let x: Int = 3;
        while (x > 0) {
            x = x - 1;
        }
        dump(x); // Expect 0
    }
}
