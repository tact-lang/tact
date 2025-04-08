struct WithDefaults {
    x: Int = 10;
    y: Bool = false;
    
    optStr: String?; // implicit default null
}

contract DefaultsContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{}; // use defaults and implicit null for opt
    }
}
