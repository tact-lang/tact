struct S1 {
    f1: Int? as uint8;
    f2: Bool;
    f3: Int as uint4;
}

contract OptionalSerializedStruct {
    s: S1;

    init() {
        self.s = S1{
            f1: null,
            f2: false,
            f3: 15,
        };
    }
}
