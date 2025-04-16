struct SDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract DefaultsInside {
    s: SDefaults;

    init() {
        self.s = SDefaults{ a:5, b:true, c:null, d:true };
    }
}