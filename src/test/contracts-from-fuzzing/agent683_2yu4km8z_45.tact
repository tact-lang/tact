struct OptionalContainer {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
}

contract OptContainer {
    val: OptionalContainer;

    init() {
        self.val = OptionalContainer{
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null
        };
    }
}