struct InnerMix {
    n: Int?;
    flag: Bool?;
}

struct Combo {
    amount: Int?;
    name: String?;
    inner: InnerMix?;
    comment: Slice?;
}

contract TestComboNestedOptional {
    data: Combo = Combo{
        amount: null,
        name: null,
        inner: null,
        comment: null
    };
    init() {}
}