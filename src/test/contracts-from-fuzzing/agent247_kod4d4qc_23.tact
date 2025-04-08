struct Middle {
    left: Int;
    right: Bool;
}

struct Top {
    inner1: Middle;
    inner2: Middle;
}

contract StructTwice {
    st: Top;
    init() {
        self.st = Top{
            inner1: Middle{left:1,right:true},
            inner2: Middle{left:2,right:false}
        };
    }
}