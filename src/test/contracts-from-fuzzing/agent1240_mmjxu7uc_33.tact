contract MsgWidthsWrap {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            m: M{
                a: 15,
                b: -8,
                c: 999,
                d: -50000,
                e: 1000000
            }
        };
    }
}

struct Wrapper {
    m: M;
}

message(7) M {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}
