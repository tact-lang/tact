contract DeepOptionalLayers {
    lvl1: Int?;
    lvl2: Int?;
    lvl3: Int?;
    lvl4: Int?;
    lvl5: Int?;

    init() {
        self.lvl1 = null;
        self.lvl2 = 2;
        self.lvl3 = null;
        self.lvl4 = 4;
        self.lvl5 = null;
    }
}