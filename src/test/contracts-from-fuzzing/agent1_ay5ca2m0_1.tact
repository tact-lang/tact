struct DeepStruct {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddr: Address?;
}

contract TestStorage {
    s: DeepStruct;

    init() {
        self.s = DeepStruct{
            i: 1,
            b: true,
            s: "hello",
            c: emptyCell(),
            addr: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null,
            optCell: null,
            optAddr: null
        };
    }
}
