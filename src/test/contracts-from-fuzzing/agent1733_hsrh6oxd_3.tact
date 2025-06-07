struct MyStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Int?;
    i: String?;
}

contract TestContract {
    s: MyStruct;

    init() {
        self.s = MyStruct{
            a: 1,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: null,
            h: null,
            i: null
        };
    }
}