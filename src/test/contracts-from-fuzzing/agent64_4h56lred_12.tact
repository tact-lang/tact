struct NestedManyOpt {
    outer: InnerManyOpt;
}

struct InnerManyOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract NestedManyOptContract {
    data: NestedManyOpt = NestedManyOpt{
        outer: InnerManyOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        }
    };
}