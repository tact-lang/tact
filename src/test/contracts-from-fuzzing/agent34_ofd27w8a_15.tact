contract MixedOptionalAndNormal {
    x: Int;
    y: Bool?;
    z: String;
    ready: Bool?;

    init() {
        self.x = 5;
        self.y = null;
        self.z = "ok";
        self.ready = true;
    }
}