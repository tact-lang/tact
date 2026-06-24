contract ParamsTest(
    a: Int,
    b: Bool,
    c: String,
    d: Int?,
    e: Bool?,
    f: String?,
    g: Address
) {
    receive() {
        dump(self.a);
        dump(self.b);
        dump(self.c);
        dump(self.d);
        dump(self.e);
        dump(self.f);
        dump(self.g);
    }
}