struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: String;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract LargePersistent {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: myAddress(),
            f: "str",
            g: 2,
            h: 3,
            i: 4,
            j: 5,
        };
    }
}