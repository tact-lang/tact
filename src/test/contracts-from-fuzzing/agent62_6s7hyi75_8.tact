contract TestOptional {
    receive() {
        // Testing optional expression and non-null assertion operator (!!)
        let opt: Int? = null;
        let result: Int = opt != null ? opt!! : 100;
    }
}
