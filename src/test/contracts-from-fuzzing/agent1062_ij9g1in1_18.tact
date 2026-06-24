struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract MixedFields {
    f1: Mixed;
    f2: Mixed;

    init() {
        self.f1 = Mixed{i:1,b:true,s:"hi",o:null};
        self.f2 = Mixed{i:2,b:false,s:"bye",o:3};
    }
}