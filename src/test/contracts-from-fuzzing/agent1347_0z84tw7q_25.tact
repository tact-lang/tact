struct MixedOptionalDefaults {
    a: Int = 3;
    b: Bool?;
    c: Int? = null;
    d: Bool = true;
    e: String? = null;
    f: String = "testing";
}

contract TestContract {
    data: MixedOptionalDefaults;

    init() {
        self.data = MixedOptionalDefaults{
            b: null,
            c: null,
            e: null
        };
    }
}