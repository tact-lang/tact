struct OptionalNest {
    val: Int?;
    flag: Bool?;
}

contract OptionalDeep {
    param: OptionalNest;

    init() {
        self.param = OptionalNest{
            val: null,
            flag: true
        };
    }
}