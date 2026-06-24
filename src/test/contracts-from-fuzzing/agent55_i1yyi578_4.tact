struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{
            inner: null,
        };
    }
}