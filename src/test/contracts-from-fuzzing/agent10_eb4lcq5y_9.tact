struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

contract MultiNested {
    val: Outer;
    init() {
        self.val = Outer{
            a: Inner{ x:1,y:2 },
            b: Inner{ x:3,y:4 },
            c: Inner{ x:5,y:6 },
            d: Inner{ x:7,y:8 }
        };
    }
    receive() {}
}