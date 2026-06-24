struct Deep {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    val: Int?;
}

contract DeepNested {
    d: Deep;

    init() {
        self.d = Deep{
            inner: Inner{ flag: true, val: 10 }
        };
    }
}