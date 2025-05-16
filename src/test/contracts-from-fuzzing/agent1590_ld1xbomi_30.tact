struct Deep {
    a:Int;
}
struct Middle {
    b:Deep;
}
struct Outer {
    c:Middle;
}
struct Top {
    d:Outer;
}

contract FourDeep {
    val: Top;
    init() {
        self.val=Top{d:Outer{c:Middle{b:Deep{a:99}}}};
    }
}