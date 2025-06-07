contract InitAssignOptional {
    foo: Int?;
    bar: Bool?;
    buzz: String?;

    init() {
        self.foo = 21;
        self.bar = false;
        self.buzz = null;
    }
}