struct Inner {
    val: Int? = 123;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Inner{ val: null }
        };
    }
}