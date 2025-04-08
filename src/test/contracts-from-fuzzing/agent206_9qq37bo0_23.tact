struct WithDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "default";
    opt: Int?;
}

contract DefaultsStorage {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            opt: null
        };
    }
}
