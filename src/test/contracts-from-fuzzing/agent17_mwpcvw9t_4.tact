struct InnerOpt {
    v: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNested {
    opt: OuterOpt = OuterOpt{inner: null};
}