contract NestedOptionalsCross {
    a: Int? = null;
    b: InnerCross? = null;
}

struct InnerCross {
    c: Bool?;
    d: String?;
}
