struct Combo {
    a: Int;
    b: Bool?;
    c: Address;
    d: Cell?;
    e: Slice;
    f: String?;
}

contract Test {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: myAddress(),
            d: null,
            e: emptyCell().asSlice(),
            f: "test"
        };
    }
}