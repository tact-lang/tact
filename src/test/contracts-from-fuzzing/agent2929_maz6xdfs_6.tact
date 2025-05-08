struct BigStruct {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint64;
    e: Bool;
    f: String;
    g: Address;
    h: Cell;
    i: Slice;
    j: Int;
    k: Bool?;
    l: String;
    m: Int as int128;
    n: Bool;
    o: String?;
    p: Address;
}

contract Test {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: -8,
            b: 8,
            c: 1234,
            d: 4321,
            e: true,
            f: "big",
            g: myAddress(),
            h: emptyCell(),
            i: emptyCell().asSlice(),
            j: 99,
            k: null,
            l: "hello",
            m: -999999999,
            n: false,
            o: "optional",
            p: myAddress()
        };
    }
}