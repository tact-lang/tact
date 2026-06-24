struct EmptyOpt {
    x: Int?;
}

struct NestedInner {
    eo: EmptyOpt;
}

struct Layered {
    ni: NestedInner?;
}

contract TestContract {
    lay: Layered;

    init() {
        self.lay = Layered{ ni: null };
    }
}