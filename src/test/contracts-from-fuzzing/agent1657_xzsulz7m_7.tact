struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            inner: Inner{
                a: 12,
                b: null
            }
        };
    }
}