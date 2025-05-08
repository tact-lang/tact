struct OuterOpt {
    nested: Nested?;
    note: String;
}

struct Nested {
    label: String;
    id: Int;
}

contract OptionalNest {
    d: OuterOpt;

    init() {
        self.d = OuterOpt{
            nested: null,
            note: "test"
        };
    }
}