struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    s1: Inner;
    s2: Inner;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            s1: Inner{ x: 1, y: true },
            s2: Inner{ x: 2, y: false }
        };
    }
}