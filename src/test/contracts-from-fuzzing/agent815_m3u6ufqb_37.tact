struct DeepSer {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as int8;
    g: Int as int16;
    h: Int as int32;
    i: Int as int64;
}

contract DeepSerStore {
    d: DeepSer;

    init() {
        self.d = DeepSer{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9 };
    }
}