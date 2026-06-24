struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract MultiInner {
    val: Outer;

    init() {
        self.val = Outer{
            inner1: Inner{x:5,y:true},
            inner2: Inner{x:6,y:false}
        };
    }
}