struct BigStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract CombineVariants {
    sv: BigStruct;

    init() {
        self.sv = BigStruct{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: null
        };
    }
}