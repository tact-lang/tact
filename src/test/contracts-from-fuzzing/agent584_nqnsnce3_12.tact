struct DeepOpt {
    a: Int?;
    nested: StructNest?;
}
struct StructNest {
    b: Bool?
}

contract Test {
    foo: DeepOpt = DeepOpt{ a: null, nested: null };
}