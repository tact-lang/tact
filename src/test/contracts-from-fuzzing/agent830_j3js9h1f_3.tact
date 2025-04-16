struct NestedOptionals {
    maybeStruct: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            maybeStruct: null
        };
    }
}