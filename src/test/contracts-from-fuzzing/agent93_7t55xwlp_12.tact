struct DeepOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct WrappedDeep {
    nested: DeepOptionals;
}

contract NestedOptionals {
    f: WrappedDeep = WrappedDeep{ nested: DeepOptionals{ a: null, b: null, c: null } };
}