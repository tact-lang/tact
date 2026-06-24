struct OptNest {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract Nullables {
    data: OptNest;

    init() {
        self.data = OptNest{val: null, flag: null, text: null};
    }
}