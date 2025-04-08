struct DeepDefault {
    a: Int = 5;
    b: Bool = true;
}

struct OuterWrap {
    nested: DeepDefault = DeepDefault{};
    flag: Bool = false;
}

contract NestedDefaults {
    d: OuterWrap;

    init() {
        self.d = OuterWrap{};
    }
}