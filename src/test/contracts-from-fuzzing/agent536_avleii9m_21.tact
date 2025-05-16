struct TinyInts {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
}

contract TinyIntStruct {
    data: TinyInts = TinyInts{a:8, b:-10, c:30000, d:-100000};

    init() {
        self.data = TinyInts{a:7, b:10, c:20000, d:100000};
    }
}