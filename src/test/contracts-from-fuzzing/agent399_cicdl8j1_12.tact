contract DefaultsVsInit {
    x: Int = 1;
    y: Bool = true;
    z: String = "ok";

    init() {
        self.x = 10;
        self.y = false;
        self.z = "overridden";
    }
}