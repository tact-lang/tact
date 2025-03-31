contract TestOptionalEquality {
    receive() {
        let opt: Int? = null;
        // Testing equality between an optional and null
        if (opt != null) {
            throw(1);
        }
    }
}
