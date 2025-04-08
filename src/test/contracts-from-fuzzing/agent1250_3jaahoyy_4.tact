struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    opt: ManyOptionals = ManyOptionals{
        a: null,
        b: true,
        c: null,
        d: null
    };
}