struct ZeroSize1 {
    x: Int as uint1;
}

struct ZeroSize2 {
    x: Int as uint1;
}

struct Wrap {
    a: ZeroSize1;
    b: ZeroSize2;
}

contract TestContract {
    w: Wrap;
    init() {
        self.w = Wrap{
            a:ZeroSize1{x:0},
            b:ZeroSize2{x:1}
        };
    }
}