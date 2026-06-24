// test optional string with default null
struct Foo {
    s: String? = null;
}

contract DefaultNullOptional {
    field: Foo;

    init() {
        self.field = Foo{};
    }
}
