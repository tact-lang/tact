struct NestedOptional {
    optionalInt: Int?;
    optionalInner: Inner?;
}

struct Inner {
    value: Int;
}

contract TestNestedOptional {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            optionalInt: null,
            optionalInner: null
        };
    }
}
