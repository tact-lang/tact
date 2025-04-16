struct SerStruct {
    i8: Int as int8;
    u10: Int as uint10;
    i64: Int as int64;
    normal: Int;
}

contract Test {
    foo: SerStruct;

    init() {
        self.foo = SerStruct{
            i8: 3,
            u10: 5,
            i64: -777,
            normal: 1000
        };
    }
}