struct DeepDefault {
    a: Int = 5;
    nested: NestedInner;
}

struct NestedInner {
    b: Int = 42;
    c: Bool = false;
}

contract DeepDefaults {
    d: DeepDefault;
    init() {
        self.d = DeepDefault{
            nested: NestedInner{}
        };
    }
}