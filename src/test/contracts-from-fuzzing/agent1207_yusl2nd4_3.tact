struct WideStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool;
}

contract WideFields {
    value: WideStruct;

    init() {
        self.value = WideStruct{
            a: 1,
            b: 2,
            c: true,
            d: "test",
            e: null,
            f: false,
        };
    }
}