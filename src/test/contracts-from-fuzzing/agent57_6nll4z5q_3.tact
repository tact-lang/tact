struct InnerInner {
    z: Int?; 
}

struct Inner {
    y: InnerInner?;
}

struct Outer {
    x: Inner?;
}

contract NestedOptionals {
    s: Outer;

    init() {
        self.s = Outer{
            x: Inner{
                y: InnerInner{
                    z: 42
                }
            }
        };
    }
}