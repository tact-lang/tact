// optional struct param with nested optionals
struct P {
    foo: Int?;
    bar: String?;
}

contract NestedParamOpt(
    opt: P?
) {}
