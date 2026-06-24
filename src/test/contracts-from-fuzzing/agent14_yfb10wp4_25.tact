contract TestOptionalConditional {
    receive() {
        let opt: Int? = 10;
        dump(opt != null ? opt!! + 5 : 0); // Expected output: 15
    }
}
