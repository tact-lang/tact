struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Address;
    l: Int;
}

contract StructFieldsContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "c",
            d: 4,
            e: false,
            f: "f",
            g: null,
            h: null,
            i: null,
            j: null,
            k: myAddress(),
            l: 12
        };
    }
}