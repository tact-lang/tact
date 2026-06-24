struct Inner {
    x: Int;
    y: Bool;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract MultiNest {
    data: Outer;

    init() {
        self.data = Outer{
            mid1: Mid{
                inner1: Inner{ x:1, y:true },
                inner2: Inner{ x:2, y:false }
            },
            mid2: Mid{
                inner1: Inner{ x:3, y:true },
                inner2: Inner{ x:4, y:false }
            }
        };
    }
}