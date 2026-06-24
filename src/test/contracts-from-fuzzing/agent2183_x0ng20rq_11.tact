contract OptDefaultTest {
    foo: Int?;
    bar: Bool?;
    baz: String? = "text";

    init() {
        self.foo = null;
        self.bar = true;
    }
}