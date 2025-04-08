struct HasOptionalField {
    maybe: String?;
    flag: Bool;
}

struct Outer {
    nested: HasOptionalField;
}

contract NestedWithOptionals {
    outer: Outer;

    init() {
        self.outer = Outer{
            nested: HasOptionalField{
                maybe: "hello",
                flag: false
            }
        };
    }
}