contract SimpleOptionals {
    x: Int?;
    y: Bool?;
    z: Int? = null;
    w: Bool? = true;

    init() {
        self.x = 100;
        self.y = null;
    }
}