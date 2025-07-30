struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost?;
}

struct Outer {
    x: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: Middle{
                y: null
            }
        };
    }
}
