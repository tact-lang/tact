struct ManyInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;
}

contract SerializedInts {
    data: ManyInts;

    init() {
        self.data = ManyInts{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }
}