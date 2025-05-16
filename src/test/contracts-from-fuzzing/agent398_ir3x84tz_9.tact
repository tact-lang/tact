struct Leaf { x: Int }

struct Middle {
    leafOpt: Leaf?;
    flag: Bool;
}

contract OptionalInner {
    data: Middle;

    init() {
        self.data = Middle{ leafOpt: Leaf{ x: 99 }, flag: true };
    }
}