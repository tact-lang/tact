struct ContainsBool {
    yes: Bool;
}

contract OptBoolStorage {
    x: Int?;
    y: Bool?;
    z: ContainsBool?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}
