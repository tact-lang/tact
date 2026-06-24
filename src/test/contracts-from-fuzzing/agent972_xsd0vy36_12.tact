struct InnerDefault {
    val: Int = 10;
    name: String = "ok";
}

struct OuterDefault {
    inner: InnerDefault = InnerDefault{};
    flag: Bool = true;
}

contract TestDefaults {
    storage: OuterDefault;

    init() {
        self.storage = OuterDefault{};
    }
}
