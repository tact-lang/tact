struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct NestedOptionalHolder {
    nested: DeeplyOptional?;
}

contract OptionalNest {
    store: NestedOptionalHolder;

    init() {
        self.store = NestedOptionalHolder{
            nested: null,
        };
    }
}
