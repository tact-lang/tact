struct Seq {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint4;
    e: Int as int257;
}

contract SerializedInts {
    data: Seq;

    init() {
        self.data = Seq{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}