struct Nested {
    innerBool: Bool;
    innerInt: Int;
}

struct Wrapper {
    nested: Nested;
    optionalInner: Nested?;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            nested: Nested{ innerBool: true, innerInt: 1 },
            optionalInner: null
        };
    }
}
