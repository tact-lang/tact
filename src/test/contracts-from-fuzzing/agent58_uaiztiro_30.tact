contract OptionalStringChain {
    x: String?;
    y: String?;
    z: String?;
    w: String?;

    init() {
        self.x = null;
        self.y = "abc";
        self.z = "";
        self.w = null;
    }
}