struct WithDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "abc";
}

contract DefaultStructContract {
    def: WithDefaults;
    
    init() {
        self.def = WithDefaults{};
    }
}