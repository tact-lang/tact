contract OptionalUninitialized {
    foo: Int?;
    bar: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    a: Address?;

    init() {
        // do not assign values, rely on implicit null
    }
}