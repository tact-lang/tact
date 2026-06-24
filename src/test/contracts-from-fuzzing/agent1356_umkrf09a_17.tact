struct Inner {
    x: Int;
}

struct Middle {
    y: Inner;
}

struct Outer {
    z: Middle;
}

contract FlatDeep {
    s: Outer;

    init() {
        self.s = Outer{
            z: Middle{
                y: Inner{
                    x: 123
                }
            }
        };
    }
}
