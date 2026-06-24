struct InnerMost {
    x: Int;
}

struct Inner {
    y: InnerMost;
}

struct Middle {
    z: Inner;
}

struct Outer {
    w: Middle;
}

contract Test {
    val: Outer = Outer{
        w: Middle{
            z: Inner{
                y: InnerMost{ x: 42 }
            }
        }
    };

    receive() {}
}