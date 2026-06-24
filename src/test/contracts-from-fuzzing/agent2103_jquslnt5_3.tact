struct Nestie {
    val: Int;
    flag: Bool;
}

contract OptStructFieldTest {
    nestedOpt: Nestie? = null;

    init() {
        self.nestedOpt = null;
    }
}
