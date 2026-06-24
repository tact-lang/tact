struct ManyOpts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

struct UsesOpts {
    inner: ManyOpts;
}

contract NestedOptionals {
    storage: UsesOpts = UsesOpts{
        inner: ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
        }
    };
}