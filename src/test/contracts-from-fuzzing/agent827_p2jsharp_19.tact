contract ImplicitNullOptionals {
    foo: Int?;
    bar: Bool?;

    receive() {
        self.foo = 77;
        self.bar = true;
    }
}