struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedStruct {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: null,
            f: null
        };
    }
}
