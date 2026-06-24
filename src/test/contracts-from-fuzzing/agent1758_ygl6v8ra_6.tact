struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract BigFields {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: 3,
            d: null,
            e: "hello",
            f: null,
            g: myAddress(),
            h: null
        };
    }
}