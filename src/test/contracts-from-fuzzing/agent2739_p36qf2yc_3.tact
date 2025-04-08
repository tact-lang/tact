struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null,
            f: "optional"
        };
    }
}