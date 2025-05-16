struct Inner {
    flag: Bool;
}

struct Middle {
    inner: Inner;
    maybeInner: Inner?;
}

struct Outer {
    middle: Middle;
    maybeMiddle: Middle?;
}

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                inner: Inner{flag: true},
                maybeInner: null
            },
            maybeMiddle: null
        };
    }
}
