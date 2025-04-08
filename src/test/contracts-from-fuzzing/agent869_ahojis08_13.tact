struct ParamSet {
    val1: Int;
    val2: Bool;
    val3: Int?;
    val4: String?;
}

contract TestContract {
    a: ParamSet;
    b: ParamSet;

    init() {
        self.a = ParamSet{val1:1,val2:true,val3:null,val4:null};
        self.b = ParamSet{val1:2,val2:false,val3:3,val4:"ok"};
    }
}