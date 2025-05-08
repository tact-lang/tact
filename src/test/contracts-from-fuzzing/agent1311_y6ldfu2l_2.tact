struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: String;
    g: Address;
    h: Bool;
    i: Int;
    j: Cell;
    k: Bool;
    l: Int;
    m: Address;
    n: Slice;
    o: String;
    p: Cell;
    q: Bool;
    r: Int;
    s: String;
    t: Slice;
}

contract ManyFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: false,
            c: "one",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "two",
            g: myAddress(),
            h: true,
            i: 5,
            j: emptyCell(),
            k: true,
            l: 42,
            m: myAddress(),
            n: emptyCell().asSlice(),
            o: "hello",
            p: emptyCell(),
            q: false,
            r: 999,
            s: "world",
            t: emptyCell().asSlice(),
        };
    }
}