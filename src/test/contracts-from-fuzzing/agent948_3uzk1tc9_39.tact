contract AllOptionalDefaultsNull {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Cell? = null;
    f: Slice? = null;

    init() {
        // leave defaults
    }
}