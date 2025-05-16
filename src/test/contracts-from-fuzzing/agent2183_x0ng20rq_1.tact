struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            a: null,
            b: true,
            c: "hello"
        };
    }
}