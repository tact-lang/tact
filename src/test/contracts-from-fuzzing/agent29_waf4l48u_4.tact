struct Deep {
    level1: Int;
    level2: Int;
    level3: Int;
    optLevel4: Int?;
}

contract OptionalDeep {
    f1: Deep?;
    f2: Int?;
    init() {
        self.f1 = Deep{level1:1, level2:2, level3:3, optLevel4:null};
        self.f2 = null;
    }
}
