// testing contract parameters syntax with deeply nested composite type
contract ParamNested(
    val: Wrapper
) {
}

struct Wrapper {
    nested: SubWrapper;
}

struct SubWrapper {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
}