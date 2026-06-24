struct HasDefaults {
    x: Int = 5;
    y: Bool?;
    z: String = "Hi";
}

contract DefaultsInStorage {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            y: null
        };
    }
}