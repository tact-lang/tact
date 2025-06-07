struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    e: Slice;
    a: Address;
    o: Int?;
}

contract C {
    storage: ManyTypes;
    init() {
        self.storage = ManyTypes{
            i: 12,
            b: false,
            s: "abc",
            c: emptyCell(),
            e: emptyCell().asSlice(),
            a: myAddress(),
            o: null,
        };
    }
}