struct OptDeep {
    foo: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    bar: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    baz: String?;
}

contract TestContract {
    data: OptDeep = OptDeep{
        foo:null,
        inner:null
    };
}