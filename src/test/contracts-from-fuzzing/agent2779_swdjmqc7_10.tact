struct Inner {
    i: Int = 1;
}

struct Outer {
    inner: Inner;
    j: Int;
}

contract NestedDefaultStructs {
    outer: Outer;
    init() {
        self.outer = Outer{
            inner: Inner{},
            j: 5
        };
    }
}