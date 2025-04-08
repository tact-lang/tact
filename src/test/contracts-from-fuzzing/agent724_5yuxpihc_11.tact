struct SubNested {
    a: Int;
    b: String;
}

struct NestedDefault {
    s: SubNested;
    opt: Bool? = null;
}

contract FieldWithNestedDefault {
    nested: NestedDefault;

    init() {
        self.nested = NestedDefault{s: SubNested{a:42, b:"hi"}};
    }
}