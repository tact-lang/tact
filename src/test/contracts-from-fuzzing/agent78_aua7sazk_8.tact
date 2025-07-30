contract TestOptional {
    receive() {
        let opt: Int? = null;
        opt = 5;
        dump(opt!!);
    }
}
