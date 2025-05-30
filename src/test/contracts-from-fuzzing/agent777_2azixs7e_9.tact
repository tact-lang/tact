struct Inner {
    flag: Bool;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    mid: Middle;
    count: Int;
    opt: Int?;
}

contract DeepMix {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{ inner: Inner{ flag: true } },
            count: 99,
            opt: null
        };
    }
}