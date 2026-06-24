struct SerializeMix {
    a: Int as int1;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint16;
    e: Int;
}

contract SerializeMixTest {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            a:-1,b:2,c:3,d:4,e:5
        };
    }
}