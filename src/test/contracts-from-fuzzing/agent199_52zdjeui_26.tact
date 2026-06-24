struct SerialOptStruct {
    a: Int as int64;
    b: Int? as uint32;
    c: Int as uint4;
}

contract SerialOptCombination {
    s: SerialOptStruct;

    init() {
        self.s = SerialOptStruct{
            a: 7,
            b: null,
            c: 2,
        };
    }
}