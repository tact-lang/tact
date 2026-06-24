struct DeepOptionalDefaults {
    a: Int? = null;
    b: Inner?
}

struct Inner {
    c: Bool? = null;
    d: String? = null;
}

contract OptDefaultsContract {
    storage: DeepOptionalDefaults;
    init() {
        self.storage = DeepOptionalDefaults{};
    }
}