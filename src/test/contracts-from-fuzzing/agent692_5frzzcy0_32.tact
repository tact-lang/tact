struct EmptyInner {
    x: Int;
}

struct Middle {
    first: EmptyInner;
}

struct Outer {
    middle: Middle;
}

contract MultiNest {
    val: Outer;

    init() {
        self.val = Outer{
            middle: Middle{
                first: EmptyInner{
                    x: 99
                }
            }
        };
    }
}