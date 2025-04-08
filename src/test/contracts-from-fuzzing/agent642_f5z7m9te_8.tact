struct HasOptionals {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optStr: String?;
    optSlice: Slice?;
}

contract TestContract {
    data: HasOptionals;

    init() {
        self.data = HasOptionals{
            optInt: null,
            optBool: null,
            optCell: null,
            optStr: null,
            optSlice: null
        };
    }
}