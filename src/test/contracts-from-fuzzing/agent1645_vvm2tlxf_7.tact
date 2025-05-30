struct Wide {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as int16 = -3;
    d: Bool = true;
    e: Bool = false;
    f: String = "x";
    g: String = "y";
    h: Address? = null;
    i: Int? = null;
    j: String? = null;
    k: Bool? = null;
    m: Int as uint4 = 7;
}

contract WideFields {
    data: Wide = Wide{};

    init() {}
}