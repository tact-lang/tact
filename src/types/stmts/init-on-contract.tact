contract Contract(
    foo: Int as int16,
    bar: Int as int16,
    baz: Int as int16 = 0
) {
    get fun getFoobar(): Int {
        return self.foo + self.bar + self.baz;
    }
}