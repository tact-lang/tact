struct StructWithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalStructStorage {
    s: StructWithOptionals;

    init() {
        self.s = StructWithOptionals{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}