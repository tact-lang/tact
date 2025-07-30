struct OptAndDefaults {
    x: Int = 42;
    y: Bool?;
    z: String = "hello";
}

contract OptDefaultFields {
    data: OptAndDefaults;

    init() {
        self.data = OptAndDefaults{
            y: null
        };
    }
}