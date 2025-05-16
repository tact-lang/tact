struct AnnotatedInts {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int8;
    d: Int as uint32;
    e: Int as int257;
}

contract AnnotatedContract {
    data: AnnotatedInts;

    init() {
        self.data = AnnotatedInts{
            a: 0,
            b: 1,
            c: 2,
            d: 3,
            e: 4
        };
    }
}