struct SOne {
    x: Int;
}

struct STwo {
    y: Int;
}

contract MultiStructEmbed {
    s1: SOne;
    s2: STwo;

    init() {
        self.s1 = SOne{ x: 5 };
        self.s2 = STwo{ y: 10 };
    }
}