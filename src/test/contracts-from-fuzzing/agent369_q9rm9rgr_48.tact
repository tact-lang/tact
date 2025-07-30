contract OptionalBasicTypes {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    slice: Slice?;
    builder: Builder?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.a = null;
        self.c = null;
        self.slice = null;
        self.builder = null;
    }
}