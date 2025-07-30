contract TestOptionalCorrected {
    receive() {
        let a: Int? = 42;
        dump(a);
    }
}
