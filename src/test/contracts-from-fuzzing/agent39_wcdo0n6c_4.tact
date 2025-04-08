struct InnerMost {
    x: Int;
}

struct Middle {
    y: InnerMost?;
}

struct Outer {
    z: Middle?;
}

contract TestContract {
    complexField: Outer;

    init() {
        self.complexField = Outer{
            z: Middle{
                y: InnerMost{ x: 42 }
            }
        };
    }
}