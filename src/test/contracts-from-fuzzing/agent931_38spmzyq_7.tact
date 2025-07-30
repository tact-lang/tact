contract OptionalAndDefault {
    x: Int = 5;
    y: Int?;
    z: Bool = false;
    w: Bool?;
    s: String = "default";
    t: String?;

    init() {
        self.y = null;
        self.w = null;
        self.t = null;
    }
}