struct MultiType {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
}

contract Test {
    val: MultiType;
    init() {
        self.val = MultiType{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: "hello"
        };
    }
}
