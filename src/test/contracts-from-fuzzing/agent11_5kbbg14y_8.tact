contract TestOptional {
    receive() {
        let opt: Int? = 42;
        if (opt != null) {
            dump(opt!!);
        }
    }
}
