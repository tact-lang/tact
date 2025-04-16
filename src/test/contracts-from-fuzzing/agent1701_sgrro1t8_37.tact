contract InitDefaultsOptional {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        // leave all unassigned
    }
}