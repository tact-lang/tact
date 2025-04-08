struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: true,
            c: "hello",
            d: null,
            e: emptyCell(),
        };
    }
}