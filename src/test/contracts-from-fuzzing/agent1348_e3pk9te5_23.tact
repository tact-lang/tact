contract NilDefaults {
    a: Int?;
    b: Address?;
    c: Cell?;
    d: Bool?;
    e: Slice?;
    f: String?;

    receive() {
        if (self.a != null) {
            dump(self.a!!);
        }
        if (self.b != null) {
            dump(self.b!!);
        }
        if (self.c != null) {
            dump(self.c!!);
        }
        if (self.d != null) {
            dump(self.d!!);
        }
        if (self.e != null) {
            dump(self.e!!);
        }
        if (self.f != null) {
            dump(self.f!!);
        }
    }
}