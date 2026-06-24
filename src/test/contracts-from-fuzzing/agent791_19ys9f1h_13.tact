struct Mixed {
    a: Int;
    b: Bool;
    c: Bool;
    d: Address;
    e: Int?;
}

contract TestContract {
    mixed: Mixed = Mixed{
        a: 1,
        b: true,
        c: false,
        d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        e: null
    };
}
