contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{deep: Deep{val: 1}},
            count: 42
        };
    }
}

struct Outer {
    inner: Inner;
    count: Int;
}

struct Inner {
    deep: Deep;
}

struct Deep {
    val: Int;
}