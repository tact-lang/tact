struct Complex {
    intval: Int;
    boolval: Bool;
    strval: String;
    addr: Address;
    optint: Int?;
    optbool: Bool?;
    optstr: String?;
    optaddr: Address?;
}

contract MixTypes {
    state: Complex;
    init() {
        self.state = Complex {
            intval: 1,
            boolval: false,
            strval: "foo",
            addr: myAddress(),
            optint: null,
            optbool: null,
            optstr: null,
            optaddr: null
        };
    }
}