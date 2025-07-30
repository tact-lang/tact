contract DefaultedVars {
    x: Int = 0;
    y: Bool = false;
    z: Int? = null;

    init() {
        self.x = 5;
        self.y = true;
        self.z = null;
    }
}