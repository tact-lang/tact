contract TestOptional {
    receive() {
        let a: Int? = 456;
        dump(a!!);
    }
}
