contract TestAddition {
    receive() {
        let sum: Int = 10 + 32;
        dump(sum);
    }
}
