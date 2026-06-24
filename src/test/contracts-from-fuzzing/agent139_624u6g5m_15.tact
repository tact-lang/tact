contract PrimitivesAndOptionals {
    a: Int;
    b: String?;
    c: Bool;
    d: Address?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = false;
        self.d = null;
    }
}