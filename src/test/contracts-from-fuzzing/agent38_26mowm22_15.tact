struct Inner {
    innerVal: Int = 7;
}

struct Outer {
    val: Int;
    nested: Inner;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            val: 42,
            nested: Inner{}
        };
    }
}
