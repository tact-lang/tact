struct T {
    inner: Int?;
}

contract OptionalStructFieldWithDefault {
    f: T = T{ inner: null };
    init() {}
}