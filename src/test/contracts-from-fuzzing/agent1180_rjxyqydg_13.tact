trait X {
    foo: Int;
    bar: Bool;
}

contract TraitInherit with X {
    foo: Int;
    bar: Bool;
    baz: String;

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "hello";
    }
}
