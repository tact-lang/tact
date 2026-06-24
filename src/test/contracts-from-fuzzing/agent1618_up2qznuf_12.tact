struct InnerMost {
    q: Int;
}

struct Inner {
    m: InnerMost?;
    x: Int;
}

struct Outer {
    child: Inner;
    flag: Bool;
}

contract NestedCompositeOptionals {
    store: Outer;

    init() {
        self.store = Outer{
            child: Inner{m: null, x: 123},
            flag: true
        };
    }
}