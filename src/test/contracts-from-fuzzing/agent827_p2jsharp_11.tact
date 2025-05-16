contract MultiInitVars {
    foo: Int;
    bar: Bool;
    label: String;
    amount: Int;

    init() {
        self.foo = 99;
        self.bar = false;
        self.label = "xyz";
        self.amount = 12345;
    }

    receive() {
        self.foo = self.foo + 1;
    }
}