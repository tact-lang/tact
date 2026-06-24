struct InnerNest {
    val: Int;
}

struct DeepNester {
    lvl1: Int;
    lvl2: InnerNest;
}

contract TestContract {
    deepData: DeepNester;

    init() {
        self.deepData = DeepNester{
            lvl1: 10,
            lvl2: InnerNest{val: 55}
        };
    }
}