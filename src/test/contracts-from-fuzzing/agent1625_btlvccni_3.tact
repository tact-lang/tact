struct MultipleOpts {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
}

contract OptFieldsTest {
    data: MultipleOpts;

    init() {
        self.data = MultipleOpts{
            intOpt: null,
            boolOpt: true,
            addrOpt: null,
            sliceOpt: null
        };
    }
}
