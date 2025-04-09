contract TestOpt {
    receive() {
        // Optional with a non-null value
        let a: Int? = 123;
        dump(a);
        // Dumping a null optional
        dump(null);
    }
}
