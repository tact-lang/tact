struct SOptInts {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct TwoLayerOpt {
    a: Int?;
    nested: SOptInts?;
}

contract OptionalsNested {
    val: TwoLayerOpt = TwoLayerOpt{ a: 4, nested: null };
}
