struct DeepDefaults {
    v: Int = 5;
    optS: String?;
}

struct Container {
    inner: DeepDefaults;
}

contract DefaultsNested {
    storage: Container;

    init() {
        self.storage = Container{
            inner: DeepDefaults{}
        };
    }
}