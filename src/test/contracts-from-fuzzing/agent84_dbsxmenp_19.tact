contract DefaultVsAssigned {
    foo: Int = 10;
    bar: Int;

    init() {
        self.bar = 100;
        self.foo = 20;
    }
}
