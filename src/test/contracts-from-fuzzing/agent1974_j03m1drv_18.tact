struct Plain { a: Int; b: Bool; opt: Int?; }

contract ManyPlainFields {
    f1: Plain;
    f2: Plain;
    f3: Plain;
    f4: Plain;
    f5: Plain;

    init() {
        self.f1 = Plain{ a:1, b:true, opt:null };
        self.f2 = Plain{ a:2, b:false, opt:null };
        self.f3 = Plain{ a:3, b:true, opt:4 };
        self.f4 = Plain{ a:5, b:false, opt:null };
        self.f5 = Plain{ a:6, b:true, opt:7 };
    }
}
