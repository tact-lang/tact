struct NestedStrOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    name: String;
    flag: Bool;
}

contract MultiNestedOption {
    field: NestedStrOpt;

    init() {
        self.field = NestedStrOpt {
            nested: null
        };
    }
}