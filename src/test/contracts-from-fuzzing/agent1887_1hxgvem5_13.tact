struct Complex {
    num: Int as uint16;
    flag: Bool;
    txt: String;
    sliceVal: Slice;
    builderRef: Builder;
    cellRef: Cell;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            num: 65535,
            flag: true,
            txt: "hello",
            sliceVal: emptyCell().asSlice(),
            builderRef: beginCell(),
            cellRef: emptyCell(),
            addressVal: myAddress(),
            optInt: null,
            optBool: false,
        };
    }
}