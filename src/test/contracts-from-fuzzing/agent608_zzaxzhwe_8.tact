struct NestedOptional {
    a: Int?;
    b: String?;
    c: Address?;
}

struct DeepNest {
    level1: NestedOptional;
    level2: NestedOptional;
    level3: NestedOptional;
}

contract Test {
    data: DeepNest = DeepNest{
        level1: NestedOptional{a:null, b:null, c:null},
        level2: NestedOptional{a:1, b:"x", c:null},
        level3: NestedOptional{a:2, b:null, c:null}
    };
}
