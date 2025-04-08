struct Inner {
    flag: Bool;
    text: String;
}

struct Outer {
    count: Int;
    inner: Inner;
    maybeInner: Inner?;
}

contract NestedOptionalsTest {
    val: Outer;

    init() {
        self.val = Outer{
            count: 5,
            inner: Inner{flag: true, text: "X"},
            maybeInner: null
        };
    }
}