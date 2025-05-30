struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract BigContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 7,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "foo",
        };
    }
}