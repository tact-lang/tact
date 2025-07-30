struct S {
    f1: Int as uint8;
    f2: Int as int16;
    f3: Int as uint32;
    f4: Int as int64;
    f5: Int as uint128;
}

contract SerializedStruct {
    s: S;

    init() {
        self.s = S{
            f1:1,f2:-2,f3:3,f4:-4,f5:5
        };
    }
}