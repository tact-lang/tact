contract MixSerializationOptionals {
    x: Int as int32;
    y: Int?;
    z: Bool?;

    init() {
        self.x = -42;
        self.y = null;
        self.z = false;
    }
}