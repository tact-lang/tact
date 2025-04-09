contract TestOptional {
    receive() {
        // Testing optional initialization with null
        let opt: Int? = null;
        dump(opt);
    }
}
