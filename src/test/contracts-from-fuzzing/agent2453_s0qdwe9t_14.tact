struct MultiTypeNest {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Int?;
    ee: Bool?;
    ff: String;
    gg: Bool;
}

contract ComboNestFields {
    top: MultiTypeNest;
    init() {
        self.top = MultiTypeNest{
            aa:1,bb:true,cc:"hi",dd:null,ee:false,ff:"hi2",gg:true
        };
    }
}