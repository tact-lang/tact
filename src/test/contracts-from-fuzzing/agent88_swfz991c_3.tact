contract TestOptionalValid() {
    receive() {
        let opt: Int? = null;
        opt = 123;
        dump(opt!!); // Expected output: 123
    }
}
