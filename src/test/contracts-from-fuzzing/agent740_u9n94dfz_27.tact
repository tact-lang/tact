struct OptionalComplex {
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optBool: Bool?;
}

contract OptionalComplexTest {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{};
    }
}