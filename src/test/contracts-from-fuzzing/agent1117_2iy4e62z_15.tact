struct Mid {
    x: Int;
    y: Int;
}

struct Outer {
    inner1: Mid;
    inner2: Mid;
    inner3: Mid;
}

contract HasMultiStruct {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Mid{x:1,y:2},
            inner2: Mid{x:3,y:4},
            inner3: Mid{x:5,y:6},
        };
    }
}
