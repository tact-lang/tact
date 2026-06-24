struct OptLevels {
    lvl1: Int?;
    lvl2: Bool?;
    lvl3: Cell?;
    lvl4: Slice?;
}

contract OptionalFields {
    opts: OptLevels;

    init() {
        self.opts = OptLevels{
            lvl1: null,
            lvl2: true,
            lvl3: null,
            lvl4: null
        };
    }
}