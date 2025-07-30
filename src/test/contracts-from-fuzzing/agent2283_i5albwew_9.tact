struct NestedDefaults {
    x: Int = 0;
    y: Bool = false;
}

struct LayerWrap {
    inner: NestedDefaults = NestedDefaults{};
    flag: Bool = false;
}

contract NestedDefaultsContract {
    data: LayerWrap;

    init() {
        self.data = LayerWrap{};
    }
}
