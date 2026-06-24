// Contract with default optional nested struct having defaults and optionals
struct Inner {
    x: Int?;
    y: Bool = true;
}

struct Outer {
    nested: Inner = Inner{};
    note: String = "hello";
}

contract OptionalNestedDefaults {
    data: Outer?;

    init() {
        self.data = Outer{
            nested: Inner{
                x: null,
                y: false
            },
            note: "test"
        };
    }
}