struct Many {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    y1: Bool?;
    y2: Bool?;
    z1: String;
    z2: String?;
}

contract AllVars {
    s: Many = Many{
        x1:1, x2:2, x3:3, x4:4,
        y1:null, y2:true,
        z1:"str", z2:null
    };

    init() {
        self.s = self.s;
    }

    receive() {
        self.s = self.s;
    }
}