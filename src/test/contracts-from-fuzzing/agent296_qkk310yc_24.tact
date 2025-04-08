struct OptionalEmpty {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract DeepNulls {
    val: OptionalEmpty;

    init() {
        self.val = OptionalEmpty{
            intOpt: null,
            boolOpt: null,
            stringOpt: null
        };
    }
}
