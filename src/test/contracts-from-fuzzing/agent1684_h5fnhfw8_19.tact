struct Mixed {
    i: Int = 7;
    b: Bool = false;
    o: Int? = null;
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    s: String = "hello";
    oo: Address? = null;
}

contract MixedStructPersistent {
    m: Mixed = Mixed{
        i: 1,
        b: true,
        o: 42,
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        s: "x",
        oo: null
    };
}