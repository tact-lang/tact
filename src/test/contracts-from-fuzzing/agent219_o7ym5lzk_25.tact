contract PlainPrimitives {
    x: Int;
    y: Bool;
    z: String;
    optI: Int?;
    optS: String?;

    init() {
        self.x = 1337;
        self.y = false;
        self.z = "hello";
        self.optI = null;
        self.optS = null;
    }
}