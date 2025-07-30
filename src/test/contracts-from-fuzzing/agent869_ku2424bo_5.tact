struct LongStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
    i: Int;
    j: Bool;
    k: Address;
    l: String;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: "d",
            e: null,
            f: null,
            g: null,
            h: null,
            i: 2,
            j: false,
            k: myAddress(),
            l: "l",
        };
    }

    receive() {}
}
