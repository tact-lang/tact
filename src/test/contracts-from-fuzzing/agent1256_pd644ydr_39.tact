contract TrickyOrdering {
    foo: Int;
    bar: Bool?;
    baz: Int;
    qux: Bool;

    init() {
        self.baz=5; self.qux=false; self.foo=1; self.bar=null;
    }
}