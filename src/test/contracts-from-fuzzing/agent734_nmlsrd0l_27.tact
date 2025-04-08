struct ComplexMixed {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    addr: Address;
    slice: Slice;
}

contract ComplexMixedTest {
    data: ComplexMixed;

    init() {
        self.data = ComplexMixed{
            optInt: null,
            optBool: true,
            optString: null,
            addr: myAddress(),
            slice: emptyCell().asSlice(),
        };
    }
}
