struct MidOptional {
    a: Int?;
    b: Bool?;
}

contract ManyMidOptional {
    x: MidOptional;
    y: MidOptional;
    z: MidOptional;

    init() {
        self.x = MidOptional{ a:null, b:null };
        self.y = MidOptional{ a:null, b:null };
        self.z = MidOptional{ a:null, b:null };
    }
}