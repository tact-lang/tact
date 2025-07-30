contract OptionalSerializations {
    a: Int? as int64 = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}