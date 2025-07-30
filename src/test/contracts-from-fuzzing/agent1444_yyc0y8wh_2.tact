struct ManyOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
}

contract TestOptional {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null,
        };
    }
}
