contract TestBinaryAdd {
    receive() {
        let result: Int = 10 + 20;
        dump(result);
    }
}
