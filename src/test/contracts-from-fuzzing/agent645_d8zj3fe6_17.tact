struct SOpt {
    innerOpt: Int?;
}

struct SNest {
    layer: SOpt;
}

contract OptionalLayer {
    n: SNest?;

    init() {
        self.n = null;
    }
}
