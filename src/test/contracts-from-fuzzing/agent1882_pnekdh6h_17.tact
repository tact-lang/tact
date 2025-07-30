struct ManyNested {
    n1: Int;
    n2: InnerWrap;
}

struct InnerWrap {
    iw: Deeper;
}

struct Deeper {
    d1: Int;
    d2: Int?;
    d3: Deepest;
}

struct Deepest {
    dd: Int;
}

contract NestMonster(
    monster: ManyNested
) {}