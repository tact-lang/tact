struct NestOptDef {
    a: Int? = null;
    b: Bool? = null;
}

struct OutOptDefault {
    nest: NestOptDef? = null;
}

contract OptionalsDefaultNesting {
    val: OutOptDefault = OutOptDefault{};
}