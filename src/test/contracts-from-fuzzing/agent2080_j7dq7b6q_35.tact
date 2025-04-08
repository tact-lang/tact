struct Outer {
    x: Int;
    inner: Inner;
}

struct Inner {
    y: Int;
    optional: String?;
}

contract NestedAgain {
    d: Outer;
    init() {
        self.d = Outer{
            x:1,
            inner: Inner{y:2, optional:null}
        };
    }
}