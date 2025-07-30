struct MixedMany {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Int;
    j: Int?;
    k: Bool;
    l: Bool?;
    m: String;
    n: String?;
}

contract ManyMixedStruct {
    payload: MixedMany;

    init() {
        self.payload = MixedMany{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "hello",
            f: null,
            g: myAddress(),
            h: null,
            i: 2,
            j: 3,
            k: false,
            l: null,
            m: "world",
            n: "!" 
        };
    }
}