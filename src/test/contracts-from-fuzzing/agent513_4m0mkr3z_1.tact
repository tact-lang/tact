struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}