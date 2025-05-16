contract TestOptionalNonNull {
    receive() {
        let opt: Int? = 123;
        dump(opt!! + 1);
    }
}
