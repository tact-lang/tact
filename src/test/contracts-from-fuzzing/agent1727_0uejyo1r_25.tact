struct Complex {
    num: Int;
    flag: Bool;
    txt: String;
    addr: Address;
    slc: Slice;
    cl: Cell;
    opt: Int?;
}

contract MaxTypeStruct {
    content: Complex;

    init() {
        self.content = Complex{
            num: 1,
            flag: true,
            txt: "Tact",
            addr: myAddress(),
            slc: emptyCell().asSlice(),
            cl: emptyCell(),
            opt: null,
        };
    }
}
