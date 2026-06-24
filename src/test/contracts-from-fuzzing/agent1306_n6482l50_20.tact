struct SerStruct {
    a: Int as uint4;
    b: Int as int16;
    c: Int;
}

contract TestContract {
    s: SerStruct;

    init() {
        self.s = SerStruct {
            a: 9,
            b: -128,
            c: 42,
        };
    }
}