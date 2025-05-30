struct NestedComplex {
    f1: Int as uint8;
    f2: Bool?;
    f3: String?;
    f4: Int?;
    f5: Int as int64;
}

struct TopComplex {
    sub: NestedComplex?;
    mark: Bool;
    data: String?;
}

contract ComplexNestedOptionalStructs {
    s: TopComplex = TopComplex{ sub: null, mark: false, data: null };

    init() {}
}