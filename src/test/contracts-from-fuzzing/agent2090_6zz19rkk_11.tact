struct InnerOptStruct {
    x: Int;
    y: Bool;
}

struct OuterWithOptNested {
    nested: InnerOptStruct?;
    s: String;
    f: Bool?;
}

contract DeepParam(
    stuff: OuterWithOptNested,
) {}