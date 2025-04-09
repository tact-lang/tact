struct Ints256 {
    a: Int as int1;
    b: Int as int8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int128;
    j: Int as uint128;
    k: Int as int257;
}

contract IntSerializationTest {
    data: Ints256;

    init() {
        self.data = Ints256{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11
        };
    }
}