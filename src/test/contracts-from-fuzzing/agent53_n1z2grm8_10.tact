struct Inner {
    a: Int as int32;
    b: Int as uint64;
    c: Bool;
    d: Address;
}

contract ManyNestedNested {
    in1: Inner;
    in2: Inner;

    init() {
        self.in1 = Inner{
            a: 1,
            b: 2,
            c: true,
            d: myAddress(),
        };
        self.in2 = Inner{
            a: 3,
            b: 4,
            c: false,
            d: myAddress(),
        };
    }
}