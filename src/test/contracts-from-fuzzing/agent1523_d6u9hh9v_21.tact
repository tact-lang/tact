contract LargeMixed {
    x1: Int = 1;
    x2: Bool = false;
    x3: Int?;
    x4: Bool?;
    y1: Int = 2;
    y2: Bool = true;
    y3: Int?;
    y4: Bool?;
    z1: Int = 3;
    z2: Bool = false;
    z3: Int?;
    z4: Bool?;

    init() {
        self.x3 = null;
        self.x4 = null;
        self.y3 = null;
        self.y4 = true;
        self.z3 = 42;
        self.z4 = false;
    }
}