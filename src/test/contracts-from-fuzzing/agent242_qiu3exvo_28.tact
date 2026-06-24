struct InnerFlags {
    a: Bool = true;
    b: Bool? = null;
}

struct OuterFlags {
    inner: InnerFlags = InnerFlags{};
}

contract BoolNest {
    flags: OuterFlags = OuterFlags{};
}