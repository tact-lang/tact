struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    data: MultiOptionals = MultiOptionals{};

    init() {
        self.data = MultiOptionals{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }
}