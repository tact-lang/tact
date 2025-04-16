struct WideStruct {
    i0: Int;
    i1: Int as int8;
    i2: Int as uint32;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    o1: Int?;
    o2: String?;
    a1: Address;
    a2: Address?;
}

contract WideStorageTest {
    big: WideStruct;

    init() {
        self.big = WideStruct{
            i0: 1,
            i1: 2,
            i2: 3,
            s1: "a",
            s2: "b",
            c1: emptyCell(),
            c2: emptyCell(),
            b1: true,
            b2: false,
            b3: true,
            o1: null,
            o2: null,
            a1: myAddress(),
            a2: null,
        };
    }
}
