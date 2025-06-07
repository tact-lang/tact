struct Inner {
    f1: Int;
    f2: String;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
    text: String;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner1: Inner{f1: 1, f2: "a"},
            inner2: Inner{f1: 2, f2: "b"},
            optInner: null,
            text: "x"
        };
    }
}