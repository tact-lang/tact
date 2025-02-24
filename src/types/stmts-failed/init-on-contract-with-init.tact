contract Contract(
    foo: Int as int16,
) {
    bar: Int as int16;
    init(bar: Int as int16) {
        self.bar = bar;
    }
    get fun getFoo(): Int {
        return self.foo;
    }
}