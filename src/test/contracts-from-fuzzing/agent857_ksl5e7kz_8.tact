struct DeepOptional {
    foo: Int?;
    nested: NestedOpt?;
}

struct NestedOpt {
    bar: Bool?;
    innerNote: String?;
}

contract TestContract {
    data: DeepOptional = DeepOptional{
        foo: null,
        nested: null
    };
}