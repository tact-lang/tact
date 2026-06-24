struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost?;
}

struct Outer {
    x: Middle?;
}

contract NestedOptionals {
    persistence: Outer;

    init() {
        self.persistence = Outer{
            x: null
        };
    }
}
