contract OptionalStructs {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Nested?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}

struct Nested {
    n: Int;
}