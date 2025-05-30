struct Foo { x: Int?; y: Bool?; }
struct Bar { foo: Foo?; val: String?; }

contract NestedParamOpt(
    nested: Bar,
) {}