struct HasBool {
    flag: Bool;
}

struct HasStruct {
    nested: HasBool;
}

contract BoolInNestedStruct {
    field: HasStruct;
    init() {
        self.field = HasStruct { nested: HasBool { flag: false } };
    }
}
