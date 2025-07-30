struct ArrStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract VariousFields {
    s: ArrStruct;

    init() {
        self.s = ArrStruct{
            a: 42,
            b: true,
            c: "test",
            d: null,
            e: false,
            f: null
        };
    }
}