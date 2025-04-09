struct Inner {
    v1: Int;
    v2: Bool;
}

struct Middle {
    f1: Inner;
    f2: Inner;
}

contract TestMultiNested {
    val: Middle;
    
    init() {
        self.val = Middle{
            f1: Inner{v1:1,v2:true},
            f2: Inner{v1:2,v2:false}
        };
    }
}
