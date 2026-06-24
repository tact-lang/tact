struct NestedDefaults {
    flag: Bool = true;
    txt: String = "ok";
}

struct HasDefaults {
    nested: NestedDefaults;
}

contract DefaultsInNest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            nested: NestedDefaults{}
        };
    }
}