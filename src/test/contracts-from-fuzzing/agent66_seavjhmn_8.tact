contract TestTernaryValid {
    receive() {
        let result: Int = (2 > 1) ? 10 : 20;
        dump(result);
    }
}
