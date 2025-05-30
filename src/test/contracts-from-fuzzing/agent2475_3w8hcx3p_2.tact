struct WithDefaults {
    x: Int = 42;
    y: Bool;
}

contract DefaultsContract {
    d: WithDefaults;
    
    init() {
        self.d = WithDefaults{ y: true };
    }
}