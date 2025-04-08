struct ManyFields {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
    f: String;
    g: Int;
    h: Bool;
    i: Slice;
    j: Cell;
    k: Address;
    l: String;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1, b: true, c: emptyCell().asSlice(), d: emptyCell(), e: myAddress(),
            f: "hi", g: 2, h: false, i: emptyCell().asSlice(), j: emptyCell(),
            k: myAddress(), l: "bye"
        };
    }
}