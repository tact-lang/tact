struct Combo {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    o: Int?;
    p: String?;
}

contract ComboStorage {
    x: Combo;

    init() {
        self.x = Combo{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            o: null,
            p: null
        };
    }
}