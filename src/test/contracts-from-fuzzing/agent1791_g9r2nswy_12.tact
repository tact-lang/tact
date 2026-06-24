struct ComplexOptional {
    str: String?;
    fl: Bool?;
    nestedOpt: Nested?;
}

struct Nested {
    val: Int;
    subOpt: Bool?;
}

contract Test13 {
    x: ComplexOptional = ComplexOptional{
        str: null,
        fl: null,
        nestedOpt: null
    };
    init() {}
}
