struct Complex {
    aa: Int;
    bb: Int?;
    cc: Bool;
    dd: Bool?;
    ee: String;
    ff: String?;
    gg: Slice;
    hh: Slice?;
    ii: Address;
    jj: Address?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            aa: 1,
            bb: null,
            cc: true,
            dd: null,
            ee: "x",
            ff: null,
            gg: emptyCell().asSlice(),
            hh: null,
            ii: myAddress(),
            jj: null
        };
    }
}