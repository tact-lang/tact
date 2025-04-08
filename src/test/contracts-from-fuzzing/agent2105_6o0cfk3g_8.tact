struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    s: ManyTypes;

    init() {
        self.s = ManyTypes{
            a: 1,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
        };
    }
}