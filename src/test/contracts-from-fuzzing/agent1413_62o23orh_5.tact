struct HasDefaults {
    x: Int = 5;
    y: Bool?;
    s: String = "hello";
}

contract DefaultedContract {
    f: HasDefaults;
    init() {
        self.f = HasDefaults{
            y: null
        };
    }
}