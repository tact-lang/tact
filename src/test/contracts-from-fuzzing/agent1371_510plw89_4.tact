struct Wide {
    i1: Int;
    i2: Int as uint8;
    i3: Int as int64;
    flag: Bool;
    txt: String;
    addr: Address;
    c1: Cell;
    s1: Slice;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    i4: Int;
    i5: Int;
    s2: String;
    s3: String;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
}

contract ManyFields {
    storage: Wide;

    init() {
        self.storage = Wide{
            i1: 1,
            i2: 255,
            i3: -64,
            flag: true,
            txt: "hello",
            addr: myAddress(),
            c1: emptyCell(),
            s1: emptyCell().asSlice(),
            b1: true,
            b2: false,
            b3: true,
            b4: false,
            i4: 4,
            i5: 5,
            s2: "a",
            s3: "b",
            i6: 6,
            i7: 7,
            i8: 8,
            i9: 9,
            i10: 10
        };
    }
}
