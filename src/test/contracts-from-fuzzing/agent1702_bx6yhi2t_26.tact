struct Rec {
    val: Int;
    flag: Bool;
}

contract ManyRecs {
    rec1: Rec;
    rec2: Rec;
    rec3: Rec;

    init() {
        self.rec1=Rec{val:1,flag:true}; self.rec2=Rec{val:2,flag:false}; self.rec3=Rec{val:3,flag:true};
    }
}
