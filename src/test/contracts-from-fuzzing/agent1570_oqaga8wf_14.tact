struct MixMany {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bl: Builder;
    addr: Address;
    optI: Int?;
    optB: Bool?;
    str2: String;
    addr2: Address;
    flag: Bool;
}

contract MixedFields {
    pod: MixMany;

    init() {
        self.pod = MixMany{
            i: 1,
            b: false,
            s: "foo",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell(),
            addr: myAddress(),
            optI: null,
            optB: true,
            str2: "bar",
            addr2: myAddress(),
            flag: true
        };
    }
}