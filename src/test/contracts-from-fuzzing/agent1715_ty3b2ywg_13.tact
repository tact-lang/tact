struct NestedDefaults {
    n: InnerDefault;
}

struct InnerDefault {
    foo: Int = 42;
    bar: String = "baz";
}

contract TestContract {
    d: NestedDefaults = NestedDefaults{
        n: InnerDefault{} // uses defaults on fields
    };
}