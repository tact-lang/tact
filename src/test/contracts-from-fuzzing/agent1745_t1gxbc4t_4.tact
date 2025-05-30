struct OptionalNested {
    val: Int?;
    msg: String?;
    flag: Bool?;
}

contract OptionalFields {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            val: null,
            msg: null,
            flag: null
        };
    }
}