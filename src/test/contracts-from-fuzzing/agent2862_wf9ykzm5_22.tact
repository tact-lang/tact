struct OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Slice?;
}

contract NullDefaultAll {
    opt: OnlyOptionals = OnlyOptionals{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
    };
}