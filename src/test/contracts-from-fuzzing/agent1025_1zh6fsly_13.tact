struct OptInner {
    x: Int?;
    y: Int?;
}

struct Container {
    opt: OptInner?;
}

contract OptInsideOpt {
    cont: Container;

    init() {
        self.cont = Container{ opt: null };
    }
}
