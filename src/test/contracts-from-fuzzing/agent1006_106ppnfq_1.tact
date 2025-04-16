struct LargeStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Address;
    g: Slice;
    h: String;
    i: Bool;
    j: Int;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1, b: null, c: true, d: "hi", e: emptyCell(), f: myAddress(), g: emptyCell().asSlice(),
            h: "foo", i: false, j: 12
        };
    }
}
