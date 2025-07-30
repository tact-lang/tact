struct RecA {
    val: Int;
}

struct RecB {
    optA: RecA?;
    optVal: Int?;
}

contract MultiLayerOpt {
    recB: RecB?;

    init() {
        self.recB = null;
    }
}
