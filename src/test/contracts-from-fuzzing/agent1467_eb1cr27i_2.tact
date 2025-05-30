struct Inner {
    flag: Bool;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNest {
    outer: Outer;
    
    init() {
        self.outer = Outer{
            middle: Middle{
                inner: Inner{
                    flag: false
                }
            }
        };
    }
}