struct WithDefaults {
    x: Int = 42;
    y: Bool = false;
    z: Int?;
}

contract DefaultStructs {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{ z:null };
    }
}