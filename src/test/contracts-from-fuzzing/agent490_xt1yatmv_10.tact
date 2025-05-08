struct MixedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract {
    m: MixedStruct;

    init() {
        self.m = MixedStruct{
            a: 1,
            b: false,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}