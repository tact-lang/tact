struct SerialOps {
    a: Int as int4;
    b: Int as int8;
    c: Int as int16;
    d: Int as int32;
    e: Int as int64;
    f: Int as int128;
    g: Int as int257;
}

contract SerialOpsStore {
    data: SerialOps;

    init() {
        self.data = SerialOps{ a:1,b:2,c:3,d:4,e:5,f:6,g:7 };
    }
}