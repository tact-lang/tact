struct OptInner {
    foo: Int?;
    bar: Bool?;
}

struct WrapOptInner {
    nested: OptInner;
    label: String?;
}

contract NestedComplexOptional {
    val: WrapOptInner;

    init() {
        self.val = WrapOptInner {
            nested: OptInner { foo: null, bar: null },
            label: null
        };
    }
}