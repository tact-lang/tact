struct InnerBig {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
}

struct OuterBig {
    y1: Int;
    y2: Int;
    y3: Int;
    inner: InnerBig;
    y4: Int;
    y5: Int;
}

contract BigNest {
    data: OuterBig;

    init() {
        self.data = OuterBig{
            y1:1,y2:2,y3:3,
            inner: InnerBig{ x1:10,x2:20,x3:30,x4:40,x5:50 },
            y4:4,y5:5
        };
    }
}