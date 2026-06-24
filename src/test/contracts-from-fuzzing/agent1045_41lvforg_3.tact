struct OptionalNest {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{val: null, flag: true, text: null};
    }
}