struct NestedDefaultOpt {
    a: Int?;
    b: Int = 1;
    c: Bool?;
    d: String = "x";
}

struct Wrap {
    inner: NestedDefaultOpt;
    str: String = "outer";
}

contract WrapOptDef {
    w: Wrap = Wrap{ inner: NestedDefaultOpt{} };
    init() {}
}