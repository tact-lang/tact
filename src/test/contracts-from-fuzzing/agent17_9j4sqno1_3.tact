struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestFuzz {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{
            inner: Inner{
                x: 5,
                y: false
            }
        };
    }
}