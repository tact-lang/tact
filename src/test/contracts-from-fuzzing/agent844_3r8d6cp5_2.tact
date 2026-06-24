struct Deeply {
    a: Int;
    b: String?;
}

struct Nested {
    d1: Deeply;
    d2: Deeply;
}

struct Top {
    nested: Nested;
    val: Int?;
}

contract ContractWithDeep {
    info: Top = Top{
        nested: Nested{
            d1: Deeply{a:1, b:null},
            d2: Deeply{a:2, b:"hi"}
        },
        val: null
    };
}