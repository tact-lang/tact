// intentionally using many optionals and mixing serializations
contract OptionSerialize {
    x: Int? as uint8;
    y: Int? as int16;
    z: Bool?;
    t: String?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.t = null;
    }
}