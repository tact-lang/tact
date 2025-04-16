struct Container {
    sliceField: Slice;
    boolOpt: Bool?;
    intOpt: Int?;
    stringOpt: String?;
}

contract MixedOptFields {
    data: Container;

    init() {
        self.data = Container{
            sliceField: emptyCell().asSlice(),
            boolOpt: null,
            intOpt: null,
            stringOpt: null
        };
    }
}