struct InnerMost {
    a: Int;
}

struct InnerMid {
    i: InnerMost;
}

struct Middle1 {
    m: InnerMid;
}

struct Middle2 {
    m: InnerMid;
}

struct Outermost {
    x: Middle1;
    y: Middle2;
}

contract MultiNest {
    big: Outermost;

    init() {
        self.big = Outermost{
            x: Middle1{m: InnerMid{i: InnerMost{a:1}}},
            y: Middle2{m: InnerMid{i: InnerMost{a:2}}}
        };
    }
}