struct SerialTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int;
}

contract SerializationContract {
    s: SerialTest;

    init() {
        self.s = SerialTest{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}