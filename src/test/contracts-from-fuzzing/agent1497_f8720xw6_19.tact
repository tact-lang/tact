struct InnerOpt {
    opt1: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
    f: Bool;
}

contract TestContract {
    oo: OuterOpt = OuterOpt{ nested: null, f: false };
}