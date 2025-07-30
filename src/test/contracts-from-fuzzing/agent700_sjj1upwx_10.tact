struct Nested {
    big: Int;
    opt: Bool?;
}

contract DeepAndWide {
    x1: Nested;
    x2: Nested?;
    x3: Nested;
    x4: Nested?;
    x5: Nested;
    x6: Nested?;

    init() {
        self.x1 = Nested{big:1,opt:true};
        self.x2 = null;
        self.x3 = Nested{big:3,opt:false};
        self.x4 = null;
        self.x5 = Nested{big:5,opt:true};
        self.x6 = null;
    }
}