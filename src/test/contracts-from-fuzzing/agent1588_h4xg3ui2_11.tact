contract NestedOptionalFields {
    foo: Int?;
    bar: StructOpt?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}

struct StructOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}