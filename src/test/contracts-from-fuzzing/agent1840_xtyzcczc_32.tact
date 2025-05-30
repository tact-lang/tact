struct WideNested {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    s1: Inner; s2: Inner; s3: Inner; s4: Inner; s5: Inner;
}

struct Inner {
    val1: Int;
    val2: Bool;
}

contract ManyWide {
    f: WideNested;

    init() {
        self.f = WideNested{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            s1:Inner{val1:1,val2:true},
            s2:Inner{val1:2,val2:false},
            s3:Inner{val1:3,val2:true},
            s4:Inner{val1:4,val2:false},
            s5:Inner{val1:5,val2:true}
        };
    }
}