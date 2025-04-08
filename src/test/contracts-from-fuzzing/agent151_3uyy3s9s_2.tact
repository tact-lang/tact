struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestDeeplyNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ val1: 5, val2: false },
            flag: true
        };
    }
}