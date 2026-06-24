struct Mix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract MixedFields {
    data: Mix = Mix{
        a: 1,
        b: false,
        c: null,
        d: null,
        e: "Hi",
        f: null,
        g: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        h: null
    };
    receive() {}
}
