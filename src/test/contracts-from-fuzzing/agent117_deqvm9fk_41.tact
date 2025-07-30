struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner?;
}

contract OptInnerIndirect {
    val: Outer?;

    init() {
        self.val = Outer{
            nested: Inner{value:31}
        };
    }
}
