struct DeepS {
    val: Int;
    opt: Int?;
    flag: Bool;
}

contract MultiDeep {
    d1: DeepS;
    d2: DeepS;
    d3: DeepS;

    init() {
        self.d1 = DeepS{ val:1, opt:null, flag:true };
        self.d2 = DeepS{ val:2, opt:3, flag:false };
        self.d3 = DeepS{ val:4, opt:null, flag:true };
    }
}
