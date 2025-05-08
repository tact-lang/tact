struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OutOfOrder {
    data: Outer;
    init() {
        self.data = Outer{
            a:1,
            b: Inner{x:2,y:true}
        };
    }
}