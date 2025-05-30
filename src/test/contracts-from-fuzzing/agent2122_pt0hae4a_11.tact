struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract DeepStructTree {
    val: Outer;

    init() {
        self.val = Outer{
            m1: Middle{
                in1: Inner{a:1,b:true,c:"x"},
                in2: Inner{a:2,b:false,c:"y"},
            },
            m2: Middle{
                in1: Inner{a:3,b:true,c:"z"},
                in2: Inner{a:4,b:false,c:"w"},
            }
        };
    }
}