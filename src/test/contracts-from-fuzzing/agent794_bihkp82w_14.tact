struct InnerOpt {
    a: Int?;
    b: String?;
}

struct OuterOpt {
    inr: InnerOpt;
    c: Address?;
}

contract NestedOptionalFields {
    data: OuterOpt = OuterOpt{ inr: InnerOpt{ a: null, b: null }, c: null };
    init() {}
}