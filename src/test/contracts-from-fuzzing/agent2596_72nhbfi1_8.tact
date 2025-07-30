struct DeepInner {
    x: Int? = null;
}

struct OuterWithDef {
    inner: DeepInner = DeepInner{};
}

contract DeepDefaults {
    val: OuterWithDef;

    init() {
        self.val = OuterWithDef{};
    }
}