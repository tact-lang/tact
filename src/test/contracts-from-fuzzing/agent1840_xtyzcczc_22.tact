struct OptIntStr {
    i: Int?;
    s: String?;
}

struct ManyLevels {
    level1: OptIntStr;
    level2: OptIntStr;
    level3: OptIntStr;
}

contract OptsManyLevels {
    store: ManyLevels;
    init() {
        self.store = ManyLevels{
            level1: OptIntStr{i:null, s:"a"},
            level2: OptIntStr{i:2, s:null},
            level3: OptIntStr{i:null, s:null}
        };
    }
}