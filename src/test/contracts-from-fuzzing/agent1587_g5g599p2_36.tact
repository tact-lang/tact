struct InnerX { x: Int; }
struct InnerY { y: Int; }

struct InnerOpt {
    foo: InnerX?;
    bar: InnerY?;
}

contract OptCombos {
    a: InnerOpt?;

    init() {
        self.a = null;
    }
}