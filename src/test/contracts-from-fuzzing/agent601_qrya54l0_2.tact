struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: true,
            c: null,
        };
    }
}
