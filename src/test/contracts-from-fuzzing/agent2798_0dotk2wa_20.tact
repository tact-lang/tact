struct SevenFieldsNested {
    f1: Int;
    nested: NestedFields;
}

struct NestedFields {
    f2: Int;
    f3: Bool;
    f4: String;
    optF: Int?;
}

contract SevenFieldsContract {
    data: SevenFieldsNested;

    init() {
        self.data = SevenFieldsNested{
            f1: 1,
            nested: NestedFields{
                f2: 2,
                f3: true,
                f4: "hello",
                optF: null
            }
        };
    }
}