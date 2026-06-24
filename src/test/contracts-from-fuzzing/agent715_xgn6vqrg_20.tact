// test serialization of nested multiple optionals with defaults
struct OptionalWithDefaults {
    foo: Int? = null;
    bar: Bool? = true;
    baz: String? = "hi";
}

struct NestedOptDefaults {
    inner: OptionalWithDefaults? = null;
}

contract TestContract {
    data: NestedOptDefaults;

    init() {
        self.data = NestedOptDefaults{};
    }
}