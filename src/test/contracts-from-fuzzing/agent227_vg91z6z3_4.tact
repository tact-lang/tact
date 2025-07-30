contract OptionalFields {
    a: Int?;
    b: Bool?; 
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell().asSlice();
        self.e = null;
        self.f = "optional";
    }

    receive() {
        if (self.b != null) {
            let _ = self.b;
        }
    }
}
