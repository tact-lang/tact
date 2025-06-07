struct DefaultsInner {
    a: Int = 5;
}

struct DefaultsOuter {
    inner: DefaultsInner = DefaultsInner{};
}

contract NestedDefaultsStruct {
    val: DefaultsOuter;
    init() {
        self.val = DefaultsOuter{};
    }
}