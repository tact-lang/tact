struct OptWrapper {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestOpt {
    record: OptWrapper;
    init() {
        self.record = OptWrapper{ x: null, y: true, z: null };
    }
}
