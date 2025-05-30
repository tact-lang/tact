struct Outer {
    inner: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract InitNested {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ val: 42, flag: true }
        };
    }
}