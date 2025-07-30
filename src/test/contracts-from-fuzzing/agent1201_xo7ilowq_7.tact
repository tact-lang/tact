struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost?;
}

contract TestContract {
    mid: Middle;

    init() {
        self.mid = Middle{
            y: null
        };
    }
}