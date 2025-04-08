struct InnerMost {
    z: Int;
}

struct Middle {
    x: Bool;
    y: InnerMost;
}

contract TestContract {
    nested: Middle;

    init() {
        self.nested = Middle{
            x: true,
            y: InnerMost{
                z: 777
            }
        };
    }

    receive() {
        let _ = self.nested.y.z;
    }
}