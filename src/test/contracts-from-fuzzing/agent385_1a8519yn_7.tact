struct WideStruct {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: String;
    e: Int as uint16;
    f: Bool;
    g: Int as uint256;
    h: String;
    i: Int as uint1;
    j: Bool;
}

contract WideFieldsTest {
    wideData: WideStruct;

    init() {
        self.wideData = WideStruct{
            a: 1,
            b: 2,
            c: true,
            d: "d",
            e: 5,
            f: false,
            g: 123456789,
            h: "h",
            i: 1,
            j: true
        };
    }
}
