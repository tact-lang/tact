struct InnerMost {
    val: Int;
}

struct Middle {
    inner1: InnerMost;
    inner2: InnerMost;
}

contract Doubles {
    first: Middle;
    second: Middle;

    init() {
        self.first = Middle{inner1:InnerMost{val:1}, inner2:InnerMost{val:2}};
        self.second = Middle{inner1:InnerMost{val:3}, inner2:InnerMost{val:4}};
    }
}