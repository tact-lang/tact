struct MultiTypes {
    a: Int;
    b: Address;
    c: Cell;
    d: Slice;
    e: String;
    f: Bool;
}

contract MultiTypeContract {
    info: MultiTypes;

    init() {
        self.info = MultiTypes{
            a: 7,
            b: myAddress(),
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "abc",
            f: true
        };
    }
}