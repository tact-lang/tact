struct Mixed {
    sa: Int;
    sb: Int?;
}

contract PartialDefaults {
    f1: Int = 1;
    f2: Int;
    f3: Mixed = Mixed{sa:1,sb:null};
    f4: Mixed;
    init() {
        self.f2 = 2;
        self.f4 = Mixed{sa:3, sb:null};
    }
}