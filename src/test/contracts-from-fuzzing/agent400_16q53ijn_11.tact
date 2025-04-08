struct Complex {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract ManyOptionals {
    val: Complex = Complex {
        a: 0,
        b: "",
        c: false,
        d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        e: cell("te6cckEBAQEAAgAAAEysuc0="),
        f: null,
        g: null,
        h: null,
        i: null,
        j: null
    };
    init() {}
}