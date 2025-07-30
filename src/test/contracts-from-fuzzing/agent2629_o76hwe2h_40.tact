struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
    f: Int?;
}

contract FullCombo {
    val: Complex = Complex{
        a:1,
        b:true,
        c:null,
        d:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        e:null,
        f:null
    };

    init() {}
}