struct DeepDefaultsOptionals {
    level: Int = 0;
    sub: DeepDefaultsOptionalsSub = DeepDefaultsOptionalsSub{};
}

struct DeepDefaultsOptionalsSub {
    x: Int? = null;
}

contract DeepDefOpt {
    d: DeepDefaultsOptionals = DeepDefaultsOptionals{};
    init() {
        self.d = DeepDefaultsOptionals{};
    }
}