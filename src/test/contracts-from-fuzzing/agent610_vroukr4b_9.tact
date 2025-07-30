contract Test {
    x: Int;
    y: Bool;
    z: String;
    optI: Int?;
    optS: String?;
    optB: Bool?;

    init() {
        self.x = 12;
        self.y = false;
        self.z = "hello";
        self.optI = null;
        self.optS = "!";
        self.optB = null;
    }
}