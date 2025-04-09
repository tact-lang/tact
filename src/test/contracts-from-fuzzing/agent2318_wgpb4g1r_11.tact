struct DefaultMinimal {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Cell;
    e: Slice;
}

contract TestContract {
    data: DefaultMinimal;

    init() {
        self.data = DefaultMinimal{
            a: 42,
            b: true,
            c: "changed",
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}
