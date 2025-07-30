struct OptionalDefaults {
    x: Int? = null;
    y: Bool? = true;
    z: String? = "foo";
}

struct WrapOpt {
    inner: OptionalDefaults?;
}

contract OptDefaultsNested {
    data: WrapOpt;
    init() {
        self.data = WrapOpt{ inner: null };
    }
}