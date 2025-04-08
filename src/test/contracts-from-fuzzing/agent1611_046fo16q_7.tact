struct NestedOptional {
    a: Int?;
    b: String?;
    c: Address?;
}

contract OptionalFields {
    f: NestedOptional;
    init() {
        self.f = NestedOptional{ a: null, b: null, c: null };
    }
}
