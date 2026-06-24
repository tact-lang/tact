message(321) IM {
    foo: Int;
}

struct NS1 {
    msg: IM?;
    flag: Bool?;
}

struct NS2 {
    nested: NS1?;
    amount: Int?;
}

contract ComplexOptionalNest {
    st: NS2? = null;
}