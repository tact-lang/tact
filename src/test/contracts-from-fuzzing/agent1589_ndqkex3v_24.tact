struct ComposeNullables {
    v1: Int?;
    v2: Bool?;
    nested: NestedNullable;
}

struct NestedNullable {
    v3: Int?;
    v4: String?;
}

contract NullablesCombo {
    data: ComposeNullables;

    init() {
        self.data = ComposeNullables{
            v1: null,
            v2: null,
            nested: NestedNullable{
                v3: 123,
                v4: null,
            },
        };
    }
}