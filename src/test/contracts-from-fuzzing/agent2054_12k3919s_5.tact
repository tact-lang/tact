struct OptionalsDeep {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Address?;
}

struct NestedOptionalStruct { s: OptionalsDeep?; }

contract OptStructOptional {
    nested: NestedOptionalStruct = NestedOptionalStruct{ s: null };
}