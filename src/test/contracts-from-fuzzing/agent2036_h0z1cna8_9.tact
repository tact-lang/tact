struct MultiType {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract Test {
    s: MultiType;

    init() {
        self.s = MultiType{
            a:1,
            b:true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test"
        };
    }
}