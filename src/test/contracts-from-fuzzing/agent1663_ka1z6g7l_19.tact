struct OptionalInt {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract ContractOptionInt {
    opt1: Int?;
    opt2: Int?;
    opt3: Int?;
    data: OptionalInt;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = 3;
        self.data = OptionalInt{
            a:null, b:2, c:null
        };
    }
}