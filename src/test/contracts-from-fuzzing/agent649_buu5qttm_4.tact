struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    i: Inner;
}

contract DeepNest {
    value: Outer = Outer{
        i: Inner{
            im: InnerMost{
                x: 42
            }
        }
    };
    receive() {
        let _ = self.value.i.im.x;
    }
}