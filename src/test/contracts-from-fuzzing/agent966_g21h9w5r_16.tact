contract TestParams(
    foo: Int,
    bar: Bool,
    baz: String,
    qux: Address?,
    spam: Int?
) {
    receive() {
        dump(self.foo);
        dump(self.bar);
        dump(self.baz);
        dump(self.qux);
        dump(self.spam);
    }
}