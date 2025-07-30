struct InnerArray {
    a: Int;
    b: Int;
}

struct Middle {
    inner1: InnerArray;
    inner2: InnerArray;
}

contract WideNested {
    m: Middle;
    n: Middle;

    init() {
        self.m = Middle{ inner1: InnerArray{a:1,b:2}, inner2: InnerArray{a:3,b:4} };
        self.n = Middle{ inner1: InnerArray{a:5,b:6}, inner2: InnerArray{a:7,b:8} };
    }
}