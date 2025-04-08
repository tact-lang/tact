struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
        };
    }

    receive() {
        self.data = self.data;
    }
}