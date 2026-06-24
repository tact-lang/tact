struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionalStructs {
    value: OuterOpt;

    init() {
        self.value = OuterOpt{
            inner: InnerOpt{ foo: 123 },
        };
    }
}