struct OptionalNest {
    innerOpt: Int?;
    boolOpt: Bool?;
}

contract OptionalStorage {
    nestedOpt: OptionalNest?;
    val: Int;

    init() {
        self.nestedOpt = null;
        self.val = 123;
    }
}
