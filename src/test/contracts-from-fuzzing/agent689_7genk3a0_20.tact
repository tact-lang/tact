struct MixTypeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Builder;
    l: Builder?;
}

contract MixTypeStructStorage {
    data: MixTypeStruct;
    init() {
        self.data = MixTypeStruct{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: beginCell(),
            l: null,
        };
    }
}