struct ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "";
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int = 2;
    h: Bool = false;
    i: String = "foo";
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int = 3;
    n: Bool = true;
    o: String = "bar";
    p: Int?;
    q: Bool?;
    r: String?;
}

contract TestContract {
    bigStruct: ManyFields;

    init() {
        self.bigStruct = ManyFields{
            a: 10,
            b: false,
            c: "c",
            d: null,
            e: true,
            f: "f",
            g: 20,
            h: true,
            i: "i",
            j: 30,
            k: false,
            l: null,
            m: 40,
            n: false,
            o: "o",
            p: 50,
            q: true,
            r: null,
        };
    }
}
