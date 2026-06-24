struct NestedManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct HighLevel {
    nested: NestedManyOptional?;
    label: String;
}

contract OptionalWithNestedOptional {
    f: HighLevel;

    init() {
        self.f = HighLevel{
            nested: null,
            label: "label"
        };
    }
}