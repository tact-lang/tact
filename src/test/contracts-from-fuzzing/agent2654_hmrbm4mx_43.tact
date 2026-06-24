struct Rec {
    a: Int;
    b: Bool?;
}

contract InitOverrideDefaults {
    r: Rec;

    init() {
        self.r = Rec{
            a:10,
            b:null
        };
        self.r.b = true;
    }
}