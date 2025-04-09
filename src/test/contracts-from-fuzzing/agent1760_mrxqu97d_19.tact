struct StrStruct {
    a: String;
    b: String?;
    c: Int;
    d: Bool?;
}

contract StringPersist {
    s: StrStruct;

    init() {
        self.s = StrStruct{
            a: "abc",
            b: null,
            c: 42,
            d: true
        };
    }
}