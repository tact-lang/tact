struct Sub {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    stringOpt: String? = null;
    nestedOpt: Sub = Sub{
        a: null,
        b: null,
        c: null,
    };

    init() {}
}