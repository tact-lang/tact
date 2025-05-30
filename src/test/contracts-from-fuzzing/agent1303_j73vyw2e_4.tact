struct OptNest {
    innerOpt: Int?;
    boolOpt: Bool?;
}

contract TestContract {
    val1: Int?;
    val2: OptNest?;

    init() {
        self.val1 = null;
        self.val2 = null;
    }
}