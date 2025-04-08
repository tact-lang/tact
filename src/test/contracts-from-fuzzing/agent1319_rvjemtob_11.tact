struct MultiOptionals {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract MultiOptFieldsTest {
    flds: MultiOptionals;

    init() {
        self.flds = MultiOptionals{
            optInt: null,
            optBool: null,
            optCell: null,
            optSlice: null,
            optStr: null
        };
    }
}