struct MixedOptionalDefaults {
    a: Int = 5;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "hi";
    f: String? = null;
}

contract OptDefaultContract {
    data: MixedOptionalDefaults;

    init() {
        self.data = MixedOptionalDefaults{};
    }
}