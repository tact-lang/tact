struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct DeepNested {
    nested: NestedOpt;
    flag: Bool;
}

contract TestDeepStorage {
    deep: DeepNested;
    init() {
        self.deep = DeepNested{
            nested: NestedOpt{foo: 2, bar: false, baz: "deep"},
            flag: true
        };
    }
}