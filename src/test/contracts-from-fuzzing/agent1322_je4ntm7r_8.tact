struct DefaultsAndRequired {
    a: Int = 5;
    b: Int;
}

contract TestMixedDefaults {
    data: DefaultsAndRequired;

    init() {
        self.data = DefaultsAndRequired{
            b: 123
        };
    }
}