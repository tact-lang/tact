struct Combo {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract {
    data: Combo;
    init() {
        self.data = Combo{
            a: 1,
            b: "hello",
            c: true,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}