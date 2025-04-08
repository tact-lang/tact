struct NestedFields {
    s: String;
    i: Int;
    b: Bool;
    nested: InnerField;
}

struct InnerField {
    val: Int;
    opt: Bool?;
    str: String;
}

contract MultiNestedTest {
    store: NestedFields;

    init() {
        self.store = NestedFields{
            s: "hi",
            i: 123,
            b: true,
            nested: InnerField{
                val: 77,
                opt: false,
                str: "inner"
            }
        };
    }
}
