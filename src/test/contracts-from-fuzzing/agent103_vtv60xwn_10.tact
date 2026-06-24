struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullDefaults {
    data: S;

    init() {
        self.data = S{};
    }
}