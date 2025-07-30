struct Inner {
    f1: Int;
    f2: Bool;
    f3: String?;
}

struct Middle {
    in0: Int;
    in1: Inner;
    in2: Inner;
}

contract ArrayLike {
    m0: Middle;
    m1: Middle;

    init() {
        self.m0 = Middle{
            in0: 17,
            in1: Inner{f1:1,f2:true,f3:null},
            in2: Inner{f1:2,f2:false,f3:"hi"}
        };
        self.m1 = Middle{
            in0: 23,
            in1: Inner{f1:3,f2:true,f3:"x"},
            in2: Inner{f1:4,f2:false,f3:null}
        };
    }
}