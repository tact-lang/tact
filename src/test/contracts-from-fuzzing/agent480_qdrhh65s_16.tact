contract DefaultsVsInit {
    x: Int = 10;
    y: Bool = false;
    z: String? = null;

    init() {
        self.x = 20;
        self.y = true;
        self.z = "updated";
    }
}