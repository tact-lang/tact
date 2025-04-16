struct Sub {
    in1: Int;
    in2: Bool;
}

contract MultiStructs {
    s1: Sub;
    s2: Sub;

    init() {
        self.s1 = Sub{in1:1,in2:false};
        self.s2 = Sub{in1:2,in2:true};
    }
}