struct HasString {
    s: String;
}

struct HasOptionalStruct {
    nested: HasString?;
}

contract Top {
    field: HasOptionalStruct;

    init() {
        self.field = HasOptionalStruct {
            nested: null
        };
    }
}