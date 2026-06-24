contract TestContract {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = 2;
    }

    get fun get_data(): TestContract {
        return self;
    }
}