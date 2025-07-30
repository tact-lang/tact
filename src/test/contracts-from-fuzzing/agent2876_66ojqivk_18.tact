struct Combo {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MixedOpt {
    x: Combo?;
    y: Int?;
    z: String?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}