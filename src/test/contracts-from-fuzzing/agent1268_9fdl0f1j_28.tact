trait T1 {
    foo: Int;
}

contract TraitAndFields with T1 {
    foo: Int;
    bar: Int;
    baz: String?;

    init() {
        self.foo = 1;
        self.bar = 2;
        self.baz = null;
    }
}