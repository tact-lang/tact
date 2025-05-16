struct DeepOptional {
    a: Int?;
    b: String?;
}

struct TopLevel {
    x: DeepOptional?;
    y: Int;
}

contract OptionalDeep {
    stuff: TopLevel = TopLevel{x:null, y:42};
}