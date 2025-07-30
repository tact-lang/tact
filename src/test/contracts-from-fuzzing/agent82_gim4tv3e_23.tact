contract NullDefaults {
    s: NullableInner;

    init() {
        self.s = NullableInner{};
    }
}

struct NullableInner {
    a: Int?;
    b: Bool?;
    c: String?;
}
