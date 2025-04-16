contract TestContract {
    foo: Int as uint4 = 15;
    bar: Int as int8;
    baz: Bool = true;

    init() {
        self.bar = -128;
    }
}