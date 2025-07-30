struct Serializing {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as int64;
    e: Int as uint256;
}

contract StorageTest {
    s: Serializing;

    init() {
        self.s = Serializing{a:1,b:2,c:3,d:4,e:5};
    }
}
