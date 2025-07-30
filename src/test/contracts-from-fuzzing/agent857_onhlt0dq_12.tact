struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: Inner{ value: 777, flag: true }
        };
    }
}