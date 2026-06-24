contract TestOptional {
    receive() {
        let opt: Int? = null;
        opt = 42;
        if (opt != null) {
            let result: Int = opt!! + 8;
        }
    }
}
