struct InnerS {
    a: Int;
}

struct MidS {
    i: InnerS;
}

contract NestedDefaultStruct {
    d: MidS = MidS{ i: InnerS{a: 77} };
}