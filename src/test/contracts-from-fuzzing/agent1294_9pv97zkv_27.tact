struct ComboOptDef {
    a: Int?;
    b: Bool?;
    c: Int = 42;
    d: Bool = true;
}

contract OptAndDefaults {
    stuff: ComboOptDef = ComboOptDef{
        a: null,
        b: null
    };
    receive() {}
}