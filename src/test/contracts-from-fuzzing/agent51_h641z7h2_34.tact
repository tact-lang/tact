struct NestedOpt1 {
    foo: Int?;
    bar: Bool?;
}

struct NestedOpt2 {
    inner: NestedOpt1;
    baz: String = "baz";
}

contract ManyOptions {
    field: NestedOpt2;
    init() {
        self.field = NestedOpt2{ inner: NestedOpt1{ foo: null, bar: null }, baz: "baz" };
    }
}