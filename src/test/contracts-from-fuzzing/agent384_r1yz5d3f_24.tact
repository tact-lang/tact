struct SerializeFlex {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int;
}

contract SerializeStruct {
    data: SerializeFlex;

    init() {
        self.data = SerializeFlex{a:1,b:2,c:3,d:4};
    }
}