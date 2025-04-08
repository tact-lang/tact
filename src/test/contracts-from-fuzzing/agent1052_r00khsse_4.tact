struct OptionalNest {
    val: Int?;
    txt: String?;
    flag: Bool?;
}

contract OptionalsTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val: null,
            txt: null,
            flag: null
        };
    }
}