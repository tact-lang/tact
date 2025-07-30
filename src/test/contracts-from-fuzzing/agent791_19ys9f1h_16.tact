struct Combo {
    addr: Address;
    number: Int?;
    flag: Bool;
}

contract TestContract {
    combo: Combo = Combo{
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        number: null,
        flag: true
    };
}
