contract TestContract {
    // Testing a properly formed if statement
    receive() {
        let a: Int = 5;
        if (a > 3) {
            a = a + 1;
        }
    }
}
