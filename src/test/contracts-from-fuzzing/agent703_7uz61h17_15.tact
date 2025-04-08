struct Inner {
    foo: Int;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    bar: String;
}

contract NestedComposite {
    store: Outer;

    init() {
        self.store = Outer{
            mid: Middle{
                inner: Inner{foo: 5},
                flag: false
            },
            bar: "stuff"
        };
    }
}