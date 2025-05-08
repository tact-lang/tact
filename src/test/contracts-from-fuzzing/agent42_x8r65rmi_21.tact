contract ConflictInitAndDefault {
    x: Int = 1;
    y: Bool;
    z: String = "hello";

    init() {
        self.x = 100;
        self.y = true;
        self.z = "world";
    }
}