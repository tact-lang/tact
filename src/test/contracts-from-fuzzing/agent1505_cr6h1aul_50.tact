contract MixedSerialize {
    foo: Int as int64;
    bar: Int as coins;
    baz: Bool;
    bq: Bool?;

    init() {
        self.foo = -88888;
        self.bar = ton("10");
        self.baz = true;
        self.bq = null;
    }
}