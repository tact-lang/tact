struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract TestContract {
    data: ManyOptionals = ManyOptionals{
        a: null,
        b: true,
        c: null,
        d: "hello",
    };

    init() {}
}