struct Inner {
    a: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    opt: Int?;
}

contract TwoStructs {
    val: Outer;
    init() {
        self.val = Outer{inner1: Inner{a:1},inner2:Inner{a:2},opt:null};
    }
}