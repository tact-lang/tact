struct Inner {
    x: Int;
    y: Int?;
    b: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedTwoStructs {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner1: Inner{x:1, y:null, b:true},
            inner2: Inner{x:2, y:42, b:false}
        };
    }
}