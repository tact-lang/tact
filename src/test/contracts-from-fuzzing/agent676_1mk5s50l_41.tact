struct InnerOpt {
    x: Int;
    y: Int;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract PartialOptField {
    data: OuterOpt = OuterOpt{ nested: null };
}