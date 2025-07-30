struct AStruct {
    a: Int;
}

contract OptStructArrang {
    x: AStruct?;
    y: Int?;
    z: Bool?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}