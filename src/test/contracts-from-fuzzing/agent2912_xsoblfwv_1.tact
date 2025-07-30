struct DeepPoint {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract TestDeepNested {
    pos: DeepPoint;
    init() {
        self.pos = DeepPoint{ x:1, y:2, z:3 };
    }
}