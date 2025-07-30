contract DefaultsNoInit {
    foo: Int = 42;
    bar: Bool = false;
    baz: String? = null;

    receive() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hi";
    }
}