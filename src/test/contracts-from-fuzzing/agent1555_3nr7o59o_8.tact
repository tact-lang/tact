struct SerialMixed {
    a: Int as uint4;
    b: Int;
    c: Int as uint64;
    d: Bool;
    e: String?;
    f: Address;
    g: Cell?;
}

contract SerialMixedTest {
    m: SerialMixed;

    init() {
        self.m = SerialMixed{
            a:3,
            b:9999,
            c:55,
            d:false,
            e:null,
            f: myAddress(),
            g: null
        };
    }
    receive(){}
}