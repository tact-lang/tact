struct OptNest {
    nested: Int?;
    strOpt: String?;
}

contract OptionalsTest {
    v1: OptNest;

    init() {
        self.v1 = OptNest{ nested: null, strOpt: null };
    }
}