struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    addr: Address;
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
}

contract LargeStructContract {
    big: BigStruct;

    init() {
        self.big = BigStruct {
            i1: 1,
            i2: 2,
            i3: 3,
            b1: true,
            b2: false,
            s1: "hello",
            s2: "world",
            addr: myAddress(),
            optInt: null,
            optStr: null,
            optAddr: null
        };
    }
}