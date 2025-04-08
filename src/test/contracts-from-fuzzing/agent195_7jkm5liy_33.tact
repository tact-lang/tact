struct Inner {
    a: Int; b: Int?; s: String; optS: String?; flag: Bool; optFlag: Bool?;
}

contract NestedOpc {
    in1: Inner; 
    in2: Inner;

    init() {
        self.in1 = Inner{ a:1, b:null, s:"x", optS:null, flag:true, optFlag:null };
        self.in2 = Inner{ a:2, b:3, s:"y", optS:"maybe", flag:false, optFlag:true };
    }
}
