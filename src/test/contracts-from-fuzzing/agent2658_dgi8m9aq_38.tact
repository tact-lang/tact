struct Chain3 {
    s: Address?;
    val: Int;
}

struct Chain2 {
    middle: Chain3;
    b: Bool;
}

contract NestedChaining {
    deep: Chain2 = Chain2{ middle: Chain3{ s: null, val: 77 }, b: false };
}