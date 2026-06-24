// Nullable struct field containing a nested struct with optional fields
struct DeepOption {
    foo: Foo?;
}

struct Foo {
    bar: Int?;
    baz: Bool?;
}

contract TestContract {
    state: DeepOption;

    init() {
        self.state = DeepOption{
            foo: Foo{
                bar: null,
                baz: null
            }
        };
    }
}