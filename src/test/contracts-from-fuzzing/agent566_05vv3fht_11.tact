struct SerialStruct {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
    f: Int as uint256;
}

contract SerialVars {
    val: SerialStruct;

    init() {
        self.val = SerialStruct{ a:1, b:2, c:3, d:4, e:5, f:6 };
    }
}
