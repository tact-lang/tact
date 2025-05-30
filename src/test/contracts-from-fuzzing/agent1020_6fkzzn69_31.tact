struct EmptyDefaults {
    a: Int;
    b: Bool;
}

contract DefaultsStruct {
    f: EmptyDefaults;

    init() {
        self.f = EmptyDefaults{
            a: 42,
            b: true
        };
    }
}
