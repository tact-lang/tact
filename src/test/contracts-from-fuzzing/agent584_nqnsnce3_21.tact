struct OptionalNest {
    nested: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract Test {
    o: OptionalNest = OptionalNest{ nested: null };
}