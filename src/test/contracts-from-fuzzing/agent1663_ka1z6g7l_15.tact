struct ZeroDefaults {
    a: Int;
    b: Bool;
}

contract DefaultsOmitted {
    data: ZeroDefaults;

    init() {
        self.data = ZeroDefaults{
            a: 0,
            b: false,
        };
    }
}