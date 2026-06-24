struct DefaultsAndOptionals {
    a: Int = 1;
    b: Int?;
    c: Bool?;
    d: String = "default";
    e: String?;
}

contract OptionalsDefaultsFields {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{ };
    }
}
