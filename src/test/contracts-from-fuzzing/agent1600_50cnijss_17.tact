struct Inner {
    num: Int as uint8;
}

struct Outer {
    maybeInner: Inner?;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            maybeInner: Inner{ num: 42 },
            flag: false
        };
    }
}