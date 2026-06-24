struct DeepNestedDefaults {
    foo: Int = 1;
    bar: String = "x";
    baz: Int?;
}

struct Wrap {
    inner: DeepNestedDefaults;
    label: String;
}

contract NestedDefaultsConstructor {
    val: Wrap;

    init() {
        self.val = Wrap{
            inner: DeepNestedDefaults{},
            label: "label",
        };
    }
}