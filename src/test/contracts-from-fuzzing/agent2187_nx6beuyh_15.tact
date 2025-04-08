struct SerialStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
    e: Int as uint1;
}

contract SerializationStructTest {
    val: SerialStruct;

    init() {
        self.val = SerialStruct{a:1,b:-2,c:3,d:-4,e:1};
    }
}