struct InnerMost {
    x: Int;
    y: Bool;
}

struct InnerMid {
    mid: InnerMost;
    s: String;
}

struct OuterMost {
    o1: InnerMid;
    o2: InnerMid;
}

contract TestContract {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            o1: InnerMid{ mid: InnerMost{ x:1, y:true }, s:"one" },
            o2: InnerMid{ mid: InnerMost{ x:2, y:false }, s:"two" },
        };
    }
}