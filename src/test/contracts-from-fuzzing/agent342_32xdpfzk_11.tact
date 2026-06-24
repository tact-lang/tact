struct ParamStruct {
    a: Int;
    b: Bool?;
    c: Address;
    d: String?;
}

contract Test10 {
    param: ParamStruct;

    init() {
        self.param = ParamStruct{
            a: 42,
            b: null,
            c: myAddress(),
            d: "hi",
        };
    }

    receive() {
        let tmp = self.param;
    }
}