contract InitDefaultOverlap {
    foo: Int = 7;
    bar: Bool;

    init() {
        self.foo = 123; // overrides default
        self.bar = true;
    }
}