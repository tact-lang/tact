struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell;
    k: Slice;
    l: Address;
    m: Int;
    n: Bool;
    o: String;
    p: Address;
}

contract TestContract {
    val: LargeStruct;

    init() {
        self.val = LargeStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: null,
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: myAddress(),
            m: 2,
            n: false,
            o: "world",
            p: myAddress(),
        };
    }
}