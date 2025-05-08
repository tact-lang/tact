struct Inner {
    flag: Bool;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{flag: false},
            count: 0,
        };
    }
}