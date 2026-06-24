struct RecInner {
    d: Int;
}

struct RecMiddle {
    c: Int;
    inner: RecInner;
}

struct RecOuter {
    a: Int;
    b: RecMiddle;
}

contract RecNested {
    rec: RecOuter;

    init() {
        self.rec = RecOuter{
            a:1,
            b: RecMiddle{
                c:2,
                inner: RecInner{
                    d:3
                }
            }
        };
    }
}