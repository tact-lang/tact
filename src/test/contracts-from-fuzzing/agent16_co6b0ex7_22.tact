struct SerializeMix {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint256;
    x: Int;
    y: Bool;
}

contract SerializeMixedStruct {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            a:1,
            b:2,
            c:3,
            d:4,
            e:5,
            x:42,
            y:true
        };
    }
}