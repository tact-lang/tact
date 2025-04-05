contract TestRepeatValid {
    receive() {
        let result: Int = 1;
        repeat (10) {
            result *= 2;
        }
        dump(result); // Expected: 1024
    }
}
