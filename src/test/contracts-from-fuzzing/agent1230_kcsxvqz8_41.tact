struct DefaultsInDeep {
    a: Int = 1;
}

struct DeepContainer {
    inner: DefaultsInDeep = DefaultsInDeep{};
    val: Int? = null;
}

contract DeepDefaults {
    c: DeepContainer;

    init() {
        self.c = DeepContainer{};
    }
}