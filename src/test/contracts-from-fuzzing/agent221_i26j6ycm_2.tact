struct DeepNested {
    inner: Inner;
}

struct Inner {
    val: Int;
    optionalFlag: Bool?;
}

contract DeepNestedStructContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{ inner: Inner{ val: 5, optionalFlag: null } };
    }
}