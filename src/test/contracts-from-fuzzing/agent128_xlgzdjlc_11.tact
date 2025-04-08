contract InitOverrides {
    x: Int = 1;
    y: Int;
    z: Bool = false;
    opt: Int?;

    init() {
        self.y = 42;
        self.z = true;
        self.opt = null;
    }
}