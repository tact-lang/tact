contract OptionalUnset {
    foo: Int?;
    bar: Bool?;

    init() {
        // neither explicit default nor assignment; should default to null
    }
}