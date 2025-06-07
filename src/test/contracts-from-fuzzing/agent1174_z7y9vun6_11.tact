struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract OptionalNested {
    s: OuterOpt = OuterOpt{ nested: null };
}