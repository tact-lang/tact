struct Base {
    a: Int;
}

struct MidOpt {
    b: Base?;
}

contract DeepOptChain {
    field: MidOpt?;

    init() {
        self.field = null;
    }
}
