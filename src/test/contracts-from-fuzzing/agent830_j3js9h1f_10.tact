struct NestedOptionalStruct {
    maybeInner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    x: NestedOptionalStruct;

    init() {
        self.x = NestedOptionalStruct{
            maybeInner: Inner{
                foo: 123,
                bar: false
            }
        };
    }
}