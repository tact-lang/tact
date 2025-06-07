contract MixedFields {
    sval: Int as int16 = -12;
    uval: Int as uint8 = 123;
    bval: Bool = true;
    txt: String = "foo";
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    optb: Bool? = null;
    opts: String? = null;

    init() {}
}