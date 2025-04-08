struct Inner {
    val: Int;
}

struct Outer {
    optInner: Inner?;
    flag: Bool;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer {
            optInner: null,
            flag: true,
        };
    }
}