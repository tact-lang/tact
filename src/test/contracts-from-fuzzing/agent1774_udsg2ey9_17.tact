struct NestedOptionals {
    a: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    foo: Bool;
    bar: Address?;
}

contract Test {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            a: null,
            inner: null,
        };
    }
}