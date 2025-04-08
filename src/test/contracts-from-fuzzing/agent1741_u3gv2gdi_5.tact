struct TestStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    l: String?;
}

contract TestContract {
    data: TestStruct;

    init() {
        self.data = TestStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "hello",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}