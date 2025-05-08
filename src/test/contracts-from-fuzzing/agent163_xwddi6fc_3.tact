struct Params {
    flag1: Bool = true;
    flag2: Bool? = null;
    name: String = "default";
    value: Int?;
}

contract OptDefaults {
    settings: Params;

    init() {
        self.settings = Params{
            value: 123
        };
    }
}
