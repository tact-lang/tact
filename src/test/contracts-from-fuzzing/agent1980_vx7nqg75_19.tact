struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
    n: Address?;
}

contract MassiveFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: false,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null
        };
    }
}