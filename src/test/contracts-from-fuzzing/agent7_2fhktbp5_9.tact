contract TestNonNullAssertionValid {
    receive() {
        // Valid use of non-null assertion (!!) on an optional that is not null
        let opt: String? = "Non-null string";
        let nonNull: String = opt!!;
        dump(nonNull);
    }
}
