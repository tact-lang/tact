struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

contract NestedMulti {
    m: Middle;

    init() {
        self.m = Middle{
            in1: Inner{a:1,b:true,c:"yes"},
            in2: Inner{a:2,b:false,c:"no"}
        };
    }
}