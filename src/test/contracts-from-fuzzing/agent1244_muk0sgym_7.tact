struct Sub {
    x: Int = 42;
    y: Bool = true;
    z: String = "zzz";
}

struct HasDefaults {
    s: Sub;
    count: Int;
}

contract DefaultsInNestedStruct {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            s: Sub{},
            count: 5,
        };
    }
}
