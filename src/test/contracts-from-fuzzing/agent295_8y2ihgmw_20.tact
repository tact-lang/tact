contract OptionalUninitialized {
    foo: Int?;
    bar: Bool?;

    // Not setting foo/bar in init()
    init() {}
}