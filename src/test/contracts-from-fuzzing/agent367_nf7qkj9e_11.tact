struct Complex {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    cell_: Cell;
    slice_: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract TestComplex {
    data: Complex;

    init() {
        self.data = Complex{
            x: 123,
            y: false,
            z: "text",
            addr: myAddress(),
            cell_: emptyCell(),
            slice_: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optStr: null,
        };
    }
}