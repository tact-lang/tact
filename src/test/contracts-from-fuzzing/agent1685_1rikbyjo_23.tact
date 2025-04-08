struct SerialInner {
    a: Int as int64;
    b: Bool;
}

struct OuterSer {
    inner: SerialInner;
    c: Int as uint32;
}

contract SerialWrap {
    p: OuterSer;

    init() {
        self.p = OuterSer{
            inner: SerialInner{
                a: 66,
                b: true
            },
            c: 1024
        };
    }
}
