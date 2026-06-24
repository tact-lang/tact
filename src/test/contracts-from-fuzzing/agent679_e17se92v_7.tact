struct Inner {
    foo: Int?;
    bar: Bool;
}

contract ParamNested(
    composite: Inner,
    flag: Bool,
) {}