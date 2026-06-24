struct ManyFields {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    a1: Address;
    a2: Address;
}

contract LargeStructStorage {
    data: ManyFields = ManyFields{
        i1: 1,
        i2: 2,
        b1: true,
        b2: false,
        s1: "one",
        s2: "two",
        a1: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c") ,
        a2: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
    };
}