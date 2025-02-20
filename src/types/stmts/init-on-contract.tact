contract Contract(
    foo: Int as int16,
    bar: Int as int16,
) {
    get fun getFoobar(): Int {
        return self.foo + self.bar;
    }
}