struct WithDefaults {
    x: Int = 7;
    y: Bool = false;
    name: String = "hello";
    optVal: Int?;    
}

contract DefaultsUsage {
    data: WithDefaults;
    init() {
        self.data = WithDefaults {
            optVal: null,
        };
    }
}