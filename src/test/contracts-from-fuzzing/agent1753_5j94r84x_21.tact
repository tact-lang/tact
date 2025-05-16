struct MixInits {
    x: Int; // no default, must initialize
    y: Bool = true;
    z: String?;
}

contract MixedDefaults {
    state: MixInits;
    init() {
        self.state = MixInits{
            x: 3
        };
    }
}
