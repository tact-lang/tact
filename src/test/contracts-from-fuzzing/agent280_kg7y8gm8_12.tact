struct OuterOpt {
    innerOpt: InnerOpt?;
    num: Int;
}

struct InnerOpt {
    x: Int?;
    s: String;
}

contract NestedOptionals {
    o: OuterOpt = OuterOpt{ innerOpt: null, num: 100 };
}