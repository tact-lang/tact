struct S {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int8;
}

contract VarSerializers {
    val: S;

    init() {
        self.val = S{
            a: 255,
            b: -1000,
            c: 4294967295,
            d: -128,
        };
    }
}
