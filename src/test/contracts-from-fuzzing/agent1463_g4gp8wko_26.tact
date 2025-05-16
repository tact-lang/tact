struct Rec {
    s: String?;
    b: Bool;
}

contract ManyStructs {
    r1: Rec;
    r2: Rec;
    r3: Rec;
    r4: Rec;

    init() {
        self.r1 = Rec{s:"a",b:true};
        self.r2 = Rec{s:null,b:false};
        self.r3 = Rec{s:"c",b:true};
        self.r4 = Rec{s:null,b:true};
    }
}
