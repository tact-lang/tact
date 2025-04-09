contract TestContract {
    foo: Int;
    bar: Bool;

    init() {
        self.foo = 1;
        self.bar = true;
    }

    get fun getData(): TestContract {
        return self;
    }
}
