struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}