struct MixVals {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
}

contract TestMixVals {
    data: MixVals;

    init() {
        self.data = MixVals{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "str",
            f: false
        };
    }
}