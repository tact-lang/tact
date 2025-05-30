struct InnerMost {
    z: Int;
}

struct Middle {
    x: Bool;
    y: InnerMost?;
}

contract TestContract {
    nested: Middle;

    init() {
        self.nested = Middle{
            x: false,
            y: null
        };
    }

    receive() {
        let _ = self.nested.y;
    }
}