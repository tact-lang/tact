struct DeepDefaultInner {
    d: Bool = true;
}

struct MidWithDefault {
    val: Int = 7;
    nested: DeepDefaultInner = DeepDefaultInner{};
}

contract TestDefaultsInNested {
    storage: MidWithDefault;

    init() {
        self.storage = MidWithDefault{};
    }
}
