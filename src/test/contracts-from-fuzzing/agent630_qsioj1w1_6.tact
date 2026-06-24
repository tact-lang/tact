struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructTest {
    s: NestedOptional;

    init() {
        self.s = NestedOptional{
            a: null,
            b: true,
            c: null,
        };
    }
}