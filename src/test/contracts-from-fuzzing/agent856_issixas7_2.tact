struct Inner {
    flag: Bool;
    val: Int;
}

struct Middle {
    inner: Inner;
    number: Int;
    optInner: Inner?;
}

struct Outer {
    middle: Middle;
    mid2: Middle;
    count: Int;
}

contract DeepStructStorage {
    nested: Outer;

    init() {
        self.nested = Outer{
            middle: Middle{
                inner: Inner{ flag: true, val: 1 },
                number: 10,
                optInner: null
            },
            mid2: Middle{
                inner: Inner{ flag: false, val: 2 },
                number: 20,
                optInner: null
            },
            count: 99
        };
    }
}
