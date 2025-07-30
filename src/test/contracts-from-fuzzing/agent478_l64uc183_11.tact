struct OuterOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract NestedOptional {
    field: OuterOpt = OuterOpt{ inner: null };
}