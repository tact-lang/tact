struct Complex {
    num: Int as uint32;
    flag: Bool;
    text: String;
    cellData: Cell;
    sliceData: Slice;
    optionalStr: String?;
    optionalInt: Int?;
    optBool: Bool?;
}

contract StorageVariants {
    field: Complex;
    init() {
        self.field = Complex{
            num: 123,
            flag: true,
            text: "data",
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice(),
            optionalStr: null,
            optionalInt: null,
            optBool: null
        };
    }
}