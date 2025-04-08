struct NestedOptional {
    inner: OptionalInner?;
}

struct OptionalInner {
    value: Int?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: OptionalInner{
                value: 123
            }
        };
    }
}
