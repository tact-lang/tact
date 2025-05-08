struct DeepDefaults {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "abc";
    child: InnerDefaults = InnerDefaults{ x:42, y:"xyz" };
}

struct InnerDefaults {
    x: Int;
    y: String;
}

contract NestedDefaultsContract {
    persistent: DeepDefaults;

    init() {
        self.persistent = DeepDefaults{};
    }
}