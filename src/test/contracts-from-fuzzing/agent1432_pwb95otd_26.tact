struct Inner {
    a: Int = 7;
    b: String = "default";
    c: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{ c: true },
            flag: false
        };
    }
}