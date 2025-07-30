struct TestStr {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedStruct {
    dat: TestStr;

    init() {
        self.dat = TestStr{
            a: 111,
            b: null,
            c: true,
            d: false,
            e: "hi",
            f: "opt"
        };
    }
}