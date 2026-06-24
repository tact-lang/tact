struct NestedOptionalFields {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
}

struct Middle {
    nested: NestedOptionalFields;
    b: Bool;
}

contract MultiLayerOptionals {
    storage: Middle;

    init() {
        self.storage = Middle{
            nested: NestedOptionalFields{
                opt1: null,
                opt2: true,
                opt3: null
            },
            b: false
        };
    }
}
