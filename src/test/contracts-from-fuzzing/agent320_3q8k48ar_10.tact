struct MultiSerStruct {
    a: Int as uint4;
    b: Int as int12;
    c: Int as uint32;
    d: Bool;
    e: Bool;
}

contract MultiSerialization {
    thing: MultiSerStruct;
    init() {
        self.thing = MultiSerStruct{
            a: 7,
            b: -123,
            c: 123456,
            d: true,
            e: false,
        };
    }
}