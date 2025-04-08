struct Leaf {
    x: Int;
}

struct MidOpt {
    leaf: Leaf?;
}

struct OuterOpt {
    mid: MidOpt?;
}

contract Test {
    payload: OuterOpt?;
    init() {
        self.payload = null;
    }
}