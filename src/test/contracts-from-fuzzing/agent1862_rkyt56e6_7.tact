struct Inner {
    flag: Bool?;
}

struct Out {
    inner: Inner;
    val: Int;
}

contract NestedStructWithOpt {
    out: Out;

    init() {
        self.out = Out{
            inner: Inner{ flag: true },
            val: 42
        };
    }
}