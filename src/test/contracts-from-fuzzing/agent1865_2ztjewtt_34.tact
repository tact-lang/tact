struct InnerS {
    b: Bool;
}

struct OuterS {
    i: InnerS;
}

contract NestOptDef {
    x: OuterS? = null;
}