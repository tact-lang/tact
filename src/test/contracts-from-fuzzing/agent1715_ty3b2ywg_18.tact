struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    val: WithManyOptionals = WithManyOptionals{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null
    };
}