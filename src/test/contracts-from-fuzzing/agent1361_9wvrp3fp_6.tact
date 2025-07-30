struct SpecStruct {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;
    d: Int as uint8;
}

contract SpecStructHolder {
    s: SpecStruct;

    init() {
        self.s = SpecStruct{a: 1, b: -2, c: true, d: 255};
    }
}