struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

struct Wrapper {
    inner: NestedDefaults;
}

contract ParamWrapper(
    foo: Wrapper
) {}