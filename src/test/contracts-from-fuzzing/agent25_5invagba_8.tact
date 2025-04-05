contract TestOptional {
    receive() {
        let maybe: Int? = null;
        maybe = 42;
        if (maybe != null) {
            let value: Int = maybe!!;
            dump(value);
        }
    }
}
