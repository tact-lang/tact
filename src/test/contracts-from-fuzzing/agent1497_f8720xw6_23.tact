struct HasMany {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestContract {
    hm: HasMany = HasMany{
        a: 1,
        b: false,
        c: "x",
        d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        e: null,
        f: null,
        g: null,
        h: null
    };
}