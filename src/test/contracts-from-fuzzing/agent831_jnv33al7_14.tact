contract Defaulted {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "hi";

    init() {
        self.foo = 100;
        self.bar = false;
        self.baz = "bye";
    }
}