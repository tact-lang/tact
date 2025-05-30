contract DefaultValues {
    a: Int = 7;
    b: Int as uint8 = 0;
    c: Int as int64 = -42;
    d: Bool = true;
    e: String = "hello";
    f: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    g: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {}
}