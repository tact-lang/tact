struct Nested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NoDefaultsNullAssign {
    val: Nested;

    init() {
        self.val = Nested{
            a: null,
            b: null,
            c: null,
        };
    }
}