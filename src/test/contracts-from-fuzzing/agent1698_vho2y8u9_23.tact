struct Middle {
    q: Int;
    w: Bool;
}

struct Outer {
    mid: Middle;
    e: String?;
}

contract OptionalEdge {
    f: Outer;

    init() {
        self.f = Outer{mid: Middle{q: 15, w: false}, e: null};
    }
}