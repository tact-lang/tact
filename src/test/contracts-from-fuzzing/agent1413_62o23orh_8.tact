struct Outer {
    a: Int;
    b: Middle;
}
struct Middle {
    x: Int;
    y: Inner;
}
struct Inner {
    value: Int;
}

contract ThreeNest {
    var: Outer;
    init() {
        self.var = Outer{
            a:0,
            b: Middle{
                x:1,
                y: Inner{ value:2 }
            }
        };
    }
}