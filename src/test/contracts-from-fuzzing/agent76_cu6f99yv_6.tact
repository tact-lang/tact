contract EmptyStructField {
    foo: Int;
    bar: Empty;
    init() {
        self.foo = 1;
        self.bar = Empty{};
    }
}

struct Empty {
    x: Int = 0;
}