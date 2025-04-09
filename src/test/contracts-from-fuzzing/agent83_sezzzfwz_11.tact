struct Params {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int128;
    f: Int as uint256;
}

contract SerializationTest {
    params: Params;

    init() {
        self.params = Params{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }
}