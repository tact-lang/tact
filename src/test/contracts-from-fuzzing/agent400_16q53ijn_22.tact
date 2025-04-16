contract ReorderedFields {
    x: Int as uint8 = 1;
    y: Int as int64 = 2;
    z: Int as int257 = 3;
    b: Bool = false;
    s: String = "string";
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    c: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    opti: Int? = null;
    optb: Bool? = null;
    opts: String? = null;
    opta: Address? = null;
    optc: Cell? = null;

    init() {}
}