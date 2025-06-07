struct ComboNest {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract MixNested {
    combo: ComboNest = ComboNest{
        a: 1,
        b: true,
        c: "hello",
        d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
    };
}