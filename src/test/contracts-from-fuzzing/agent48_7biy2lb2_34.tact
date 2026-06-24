contract MyContract {
    foo: Int;
    bar: Int?;

    init() {
        self.foo = 5;
        self.bar = 10;
    }

    get fun test(): Int? {
        return self.bar;
    }
}