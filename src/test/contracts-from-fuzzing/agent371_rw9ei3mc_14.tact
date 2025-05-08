struct MixedOptionalDefaults {
    a: Int? = null;
    b: Bool = false;
    c: String?;
    d: String = "foo";
}

contract MixedOptDefaults {
    data: MixedOptionalDefaults;

    init() {
        self.data = MixedOptionalDefaults{
            c: null
        };
    }
}