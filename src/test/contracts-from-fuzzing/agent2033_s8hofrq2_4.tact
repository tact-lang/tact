struct OptNest {
    val: Int?;
    flag: Bool?;
    note: String?;
}

contract Test {
    s: OptNest;

    init() {
        self.s = OptNest{
            val: null,
            flag: true,
            note: null
        };
    }
}