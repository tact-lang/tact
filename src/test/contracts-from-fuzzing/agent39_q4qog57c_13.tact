struct Inner {
    a: Int;
    b: Int;
}

struct Middle {
    innerOpt: Inner?;
}

struct Outer {
    middleOpt: Middle?;
}

contract TestContract {
    outer: Outer;
    
    init() {
        self.outer = Outer{
            middleOpt: Middle{
                innerOpt: null
            }
        };
    }
}