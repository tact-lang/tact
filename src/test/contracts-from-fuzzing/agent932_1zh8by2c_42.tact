// contract parameter with optional Struct
struct ParOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptParamExample(
    nested: ParOpt?
) {}
