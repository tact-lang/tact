struct DeepOptional {
    nestedOpt: OptionalFields?;
}

struct OptionalFields {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    opt: DeepOptional = DeepOptional{
        nestedOpt: null
    };
}